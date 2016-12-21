module NewsHelper
	def self.news 
		url = "https://newsapi.org/v1/articles?source=the-next-web&sortBy=latest&apiKey="
		key = ENV['NEWS']
		news_url = url + key
		response = HTTParty.get(news_url)
	end

	def self.titles
		current_news_titles = news["articles"]
		title_heading = ""
		current_news_titles.each do |title|
			title_heading << title["title"] + ". "
		end
		title_heading
	end

end
	
