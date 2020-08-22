class NewsFeedProject::ApiService

    
        @@url = 'http://newsapi.org/v2/everything?'\
        'domains=cnn.com&'\
        'qinTitle='

        @@parameters = '&'\
        'from=2020-08-21&'\
        'sortBy=popularity&'\
        'pageSize=10&'\
        'apiKey='

        @@api_key = 'f5ab1ac1a2af4fa98ad39c97e7e4bf34'

    def self.search_news_by_article_title(query)
        full_query = @@url + query + @@parameters + @@api_key
        response = RestClient.get(full_query)
        json = JSON.parse(response)
        json["articles"].each do |articles_hash|
            NewsFeedProject::Article.new(articles_hash)
        end 
    end 

end 