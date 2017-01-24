
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
      lowest_id = Company.order(:id).first.id
      highest_id = Company.order(:id).last.id

      # total amount of companies to loop through
      total_companies = Company.count

      # get current company id to start from server cache
      company_id = Rails.cache.read(:company_id)
      company_id = company_id > highest_id ? lowest_id : company_id

      # get company ticker
      ticker = Company.find(company_id).symbol

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
          new_article = Article.new(params)
          begin
            new_article.save()
          rescue
            next
          end
        end

        current_page += 1
        api_call_count += 1
      end

      # Increase the company id to search for
      Rails.cache.write(:company_id, company_id + 1, expires_in: 5.days)
    end
  end

end
