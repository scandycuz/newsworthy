class IntrinioAPI

  def initialize
    @username = "0ddde2aec78d550af66f71063d64cd97"
    @password = "485102778e05890df8149233eb7ab687"
  end

  def test_cache
    test_num = 10
    Rails.cache.write(:test, test_num, expires_in: 20.days)
    while test_num < 20
      test_num = Rails.cache.read(:test)
      puts "Current test_num is #{test_num}"

      new_test_num = test_num + 1
      Rails.cache.write(:test, new_test_num, expires_in: 20.days)
    end
  end

  def get_articles

    api_call_count = 1

    # temporary, for initial rake task
    # Rails.cache.write(:company_id, 273, expires_in: 20.days)

    # get lowest and highest company id's to search through
    lowest_id = Company.order(:id).first.id
    highest_id = Company.order(:id).last.id

    # Daily API limit is 500
    while api_call_count < 400
      current_page, total_pages = 1, 2

      # get next company id to query API for from server cache
      company_id = Rails.cache.read(:company_id)
      company_id = company_id > highest_id ? lowest_id : company_id
      puts "Company id is now #{company_id}"

      # get company ticker
      ticker = Company.find(company_id).symbol

      # todo: after initial articles are added to database, set up logic to only add recent articles

      # loop through all pages of articles
      until current_page > total_pages do
        request_url = "https://api.intrinio.com/news?identifier=#{ticker}&page_number=#{current_page}"

        response = HTTP.basic_auth(:user => @username, :pass => @password)
        .get(request_url)
        .body

        data = JSON.parse(response)
        begin
          articles = data['data']
          current_page = data['current_page']
          total_pages = data['total_pages']
        rescue
          puts "Data error:"
          p data
          puts "Skipping"
          new_company_id = company_id + 1
          Rails.cache.write(:company_id, new_company_id, expires_in: 20.days)
          next
        end

        articles.each do |article|
          params = {title: article['title'], url: article['url'], company_id: company_id}
          begin
            Article.create(params)
          rescue
            next
          end
        end

        current_page += 1
        api_call_count += 1
      end

      # Increase the company id to search for
      new_company_id = company_id + 1
      Rails.cache.write(:company_id, new_company_id, expires_in: 20.days)

      puts "#{total_pages} pages of articles retreived for #{ticker}"
    end
  end

end
