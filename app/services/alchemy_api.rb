class AlchemyAPI

  def initialize
    @apikey = "b8766d91aff5a68cd54c21fbb43b7c4aa1e65511"
  end

  def analyze_sentiment
    ordered_companies = Company.order(:id)
    lowest_company_id = ordered_companies.first.id
    highest_company_id = ordered_companies.last.id

    # Create initial article stack to analyze
    articles_analyzed = 0
    articles_to_analyze = []
    current_company_id = Record.find_by("name = ?", "company_id_for_alchemy").data
    Article.where("company_id = ?", current_company_id).order(id: :asc).limit(20).each do |article|
      articles_to_analyze.push(article)
    end

    while true

      # Todo: after initial articles analyzed, analyze just recent articles

      # If 20 articles analyzed, go to next company
      if articles_analyzed >= 20
        articles_analyzed = 0
        new_company_id = current_company_id + 1
        Record.find_by("name = ?", "company_id_for_alchemy").update(data: new_company_id)
        current_company_id = new_company_id
        current_company_id = current_company_id > highest_company_id ? lowest_company_id : current_company_id

        # create a stack of up to 20 articles
        articles_to_analyze = []
        Article.where("company_id = ?", current_company_id).order(id: :asc).limit(20).each do |article|
          articles_to_analyze.push(article)
        end
      end

      # skip if company with id doesn't exist
      begin
        company = Company.find(current_company_id)
      rescue
        puts "Company with id #{current_company_id} doesn't exist, skipping"
        articles_analyzed = 20
        next
      end

      # Start with oldest of the stack of 20 articles
      article = articles_to_analyze.pop
      if !article
        puts "Article stack empty, #{articles_analyzed} / 20 articles analyzed for #{company}"
        articles_analyzed = 20
        next
      end

      article_id = article.id
      article_title = article.title
      target_url = article.url

      puts "Analyzing sentiment for #{article_title}"

      # get sentiment
      api_url = "https://gateway-a.watsonplatform.net/calls/url/URLGetTextSentiment"
      request_url = "#{api_url}?apikey=#{@apikey}&outputMode=json&url=#{target_url}"

      response = HTTP.get(request_url)
      .body
      data = JSON.parse(response)

      # Break if API limit reached
      if data['statusInfo'] == "daily-transaction-limit-exceeded"
        puts "Daily Alchemy API request limit reached"
        break
      end

      if !data['docSentiment']
        # increment api call count
        puts "No sentiment data, skipping"
        api_call_count += 1
        next
      end
      article_emotions = {}
      article_emotions[:sentiment] = data['docSentiment']['score'].to_f.round(2)

      # get emotions
      api_url = "https://gateway-a.watsonplatform.net/calls/url/URLGetEmotion"
      request_url = "#{api_url}?apikey=#{@apikey}&outputMode=json&url=#{target_url}"

      response = HTTP.get(request_url)
      .body
      data = JSON.parse(response)

      if !data['docEmotions']
        # increment api count
        puts "No emotion data, skipping"
        api_call_count += 2
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
      current_datapoints = Datapoint.where("company_id = ?", company.id).count
      divisor = (current_datapoints + 1).to_f
      divisor = divisor > 20 ? 20.0 : divisor

      # compute running sentiment and emotional averages
      emotions = [:sentiment, :anger, :disgust, :fear, :joy, :sadness]
      emotions.each do |emotion|
        # set prior emotion every 10 datapoints to track relative change
        if current_datapoints % 10 == 1
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

      # Update article data
      begin
        current_article = Article.find(article_id)
      rescue
        puts "Error retrieving article to update"
        articles_analyzed += 1
        api_call_count += 2
        next
      end

      article_params = {
        sentiment: article_emotions[:sentiment],
        anger: article_emotions[:anger],
        disgust: article_emotions[:disgust],
        fear: article_emotions[:fear],
        joy: article_emotions[:joy],
        sadness: article_emotions[:sadness]
      }

      begin
        current_article.update(article_params)
      rescue
        puts "Error updating article"
      end

      # increment api call count and articles analyzed
      articles_analyzed += 1
      api_call_count += 2
    end
  end

end
