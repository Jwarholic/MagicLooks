module NewsHelper
	def self.news 
		url = "https://newsapi.org/v1/articles?source=the-next-web&sortBy=latest&apiKey="
		key = "140a68ea3a0c4650b0a86faedf5b1508"
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
	
