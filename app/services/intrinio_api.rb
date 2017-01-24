
class IntrinioAPI

  def initialize
    @username = "0ddde2aec78d550af66f71063d64cd97"
    @password = "485102778e05890df8149233eb7ab687"
  end

  def get_articles

    api_call_count = 1

    # Daily API limit is 500
    while api_call_count < 400
      current_page, total_pages = 1, 2

      # get lowest and highest company id's to search through
      lowest_id = Company.order(:id).first.id
      highest_id = Company.order(:id).last.id

      # get next company id to query API for from server cache
      company_id = Rails.cache.read(:company_id)
      company_id = company_id > highest_id ? lowest_id : company_id

      # get company ticker
      ticker = Company.find(company_id).symbol

      # todo: after initial articles are added to database, set up logic to only add new articles

      # loop through all pages of articles
      until current_page > total_pages do
        request_url = "https://api.intrinio.com/news?identifier=#{ticker}&page_number=#{current_page}"

        response = HTTP.basic_auth(:user => @username, :pass => @password)
        .get(request_url)
        .body

        data = JSON.parse(response)
        articles = data['data']
        current_page = data['current_page']
        total_pages = data['total_pages']

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

      puts "#{total_pages} pages of articles retreived for #{ticker}"

      # Increase the company id to search for
      Rails.cache.write(:company_id, company_id + 1, expires_in: 5.days)
    end
  end

end
