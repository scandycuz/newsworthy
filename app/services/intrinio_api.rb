class IntrinioAPI

  def initialize
    @username = "0ddde2aec78d550af66f71063d64cd97"
    @password = "485102778e05890df8149233eb7ab687"
  end

  def get_articles

    api_call_count = 1

    # temporary, for initial rake task
    # Rails.cache.write(:company_id, 416, expires_in: 20.days)

    # get lowest and highest company id's to search through
    lowest_id = Company.order(:id).first.id
    highest_id = Company.order(:id).last.id

    # Loop until API call limit is reached
    while true
      current_page, total_pages = 1, 2

      # get next company id to query API for from server
      company_id = Record.find_by("name = ?", "company_id_for_intrinio").data
      company_id = company_id > highest_id ? lowest_id : company_id
      puts "Company id is now #{company_id}"

      # get company ticker
      begin
        ticker = Company.find(company_id).symbol.strip
      rescue
        puts "Company with that id doesn't exist, skipping"
        new_company_id = company_id + 1
        Record.find_by("name = ?", "company_id_for_intrinio").update(data: new_company_id)
        next
      end

      # todo: after initial articles are added to database, set up logic to only add recent articles

      # loop through all pages of articles
      until current_page > total_pages do
        request_url = "https://api.intrinio.com/news?identifier=#{ticker}&page_number=#{current_page}"

        response = HTTP.basic_auth(:user => @username, :pass => @password)
        .get(request_url)
        .body

        begin
          data = JSON.parse(response)
          articles = data['data']
          current_page = data['current_page']
          total_pages = data['total_pages']
        rescue
          puts "Response error:"
          p response
          puts "Skipping"
          new_company_id = company_id + 1
          Record.find_by("name = ?", "company_id_for_intrinio").update(data: new_company_id)
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
      Record.find_by("name = ?", "company_id_for_intrinio").update(data: new_company_id)

      puts "#{total_pages} pages of articles retreived for #{ticker}"
    end
  end

end
