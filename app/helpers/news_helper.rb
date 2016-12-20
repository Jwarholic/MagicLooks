module NewsHelper
	def self.news 
		url = "https://newsapi.org/v1/articles?source=the-next-web&sortBy=latest&apiKey="
		key = key = ENV['NEWS']
		newsUrl = url + key
		results = HTTParty.get(newsUrl)
	end

	def self.titles
		titles = news["articles"]
		title_string = ""
		titles.each do |title|
			title_string << title["title"] + ". "
		end
		title_string
	end

end
	
