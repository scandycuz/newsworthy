class AlchemyAPI

  def initialize
    @apikey = "b8766d91aff5a68cd54c21fbb43b7c4aa1e65511"
  end

  def analyze_sentiment
    ordered_articles = Article.order(:id)
    lowest_id = ordered_articles.first.id
    highest_id = ordered_articles.last.id

    api_call_count = 0

    # temporary variable to only look at 10 articles per company
    company_article_count = 1

    # temporary, for initial rake task
    Rails.cache.write(:article_id, lowest_id, expires_in: 20.days)

    # Daily limit is 1000 calls
    while api_call_count < 800

      # end if all articles have been analyzed
      article_id = Rails.cache.read(:article_id)
      break if article_id > highest_id

      # temporary logic to only look at 10 articles per company
      if company_article_count > 10
        company_article_count = 1

        begin
          current_article = Article.find(article_id)
        rescue
          new_article_id = article_id + 1
          Rails.cache.write(:article_id, new_article_id, expires_in: 20.days)
          next
        end

        current_company = Company.find(current_article.company_id)
        next_company_id = current_company.id + 1
        article_id = Article.where("company_id = ?", next_company_id).order(:id).first.id
        p "Skipping to article id #{article_id}"
      end

      # get article to analyze
      begin
        article = Article.find(article_id)
      rescue
        new_article_id = article_id + 1
        Rails.cache.write(:article_id, new_article_id, expires_in: 20.days)
        next
      end

      article_title = article.title
      target_url = article.url

      puts "Analyzing sentiment for #{article_title}"

      # get sentiment
      api_url = "https://gateway-a.watsonplatform.net/calls/url/URLGetTextSentiment"
      request_url = "#{api_url}?apikey=#{@apikey}&outputMode=json&url=#{target_url}"

      response = HTTP.get(request_url)
      .body

      data = JSON.parse(response)

      if !data['docSentiment']
        # increment article id and api call count
        new_article_id = article_id + 1
        Rails.cache.write(:article_id, new_article_id, expires_in: 20.days)
        api_call_count += 1
        company_article_count += 1
        next
      end
      article_emotions = {}
      article_emotions[:sentiment] = data['docSentiment']['score'].to_f.round(2)

      # get emotions
      api_url = "https://gateway-a.watsonplatform.net/calls/url/URLGetEmotion"
      request_url = "#{api_url}?apikey=#{@apikey}&outputMode=json&url=#{target_url}"

      response = HTTP.get(request_url)
      .body

      if !data['docEmotions']
        # increment article id and api call count
        new_article_id = article_id + 1
        Rails.cache.write(:article_id, new_article_id, expires_in: 20.days)
        api_call_count += 1
        company_article_count += 1
        next
      end

      data = JSON.parse(response)
      article_emotions[:anger] = data['docEmotions']['anger'].to_f.round(2)
      article_emotions[:disgust] = data['docEmotions']['disgust'].to_f.round(2)
      article_emotions[:fear] = data['docEmotions']['fear'].to_f.round(2)
      article_emotions[:joy] = data['docEmotions']['joy'].to_f.round(2)
      article_emotions[:sadness] = data['docEmotions']['sadness'].to_f.round(2)

      # create datapoint
      datapoint_params = {
        company_id: article.company_id,
        article_id: article_id,
        sentiment: article_emotions[:sentiment],
        anger: article_emotions[:anger],
        disgust: article_emotions[:disgust],
        fear: article_emotions[:fear],
        joy: article_emotions[:joy],
        sadness: article_emotions[:sadness]
      }
      begin
        Datapoint.create(datapoint_params)
      rescue
        puts "Error creating datapoint"
        next
      end

      # Update Company data
      company = Company.find(article.company_id)
      current_datapoints = Datapoint.where("company_id = ?", company.id).count
      divisor = (current_datapoints + 1).to_f
      divisor = divisor > 10 ? 10.0 : divisor

      # compute running sentiment and emotional averages
      emotions = [:sentiment, :anger, :disgust, :fear, :joy, :sadness]
      emotions.each do |emotion|
        # set prior emotion every 5 datapoints to track relative change
        if current_datapoints % 5 == 1
          company[:"prev_#{emotion}"] = company[:"#{emotion}"]
        end
        current_average = company[:"#{emotion}"]
        current_average += (article_emotions[:"#{emotion}"] - current_average) / divisor
        company[:"#{emotion}"] = current_average
      end

      begin
        company.save
      rescue
        puts "Error updating company"
        next
      end

      # increment article id and api call count
      new_article_id = article_id + 1
      Rails.cache.write(:article_id, new_article_id, expires_in: 20.days)
      api_call_count += 1
      company_article_count += 1
    end
  end

end
