require 'pry'

module WeatherHelper

	def self.weather
		#Get location of the IP user
		response = HTTParty.get("http://ip-api.com/json")
		lon = response["lon"]
		lat = response["lat"]

		key = "0b00512afd38eb31d828e615774a2fd4"
		#Call the weather api for the results.
		weather = "http://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}&appid=#{key}"
		results = HTTParty.get(weather)

  end

  #GET THE ICON FOR THE CURRENT WEATHER.
  def self.weatherimage
  	icon = weather["weather"][0]["icon"]
  	imageurl = "http://openweathermap.org/img/w/#{icon}.png"
  end

  #Weather temp
  def self.weathertemp
		(1.8 * (weather["main"]["temp"] - 273) + 32).ceil
  end

  #weather description
  def self.weatherdesc
  	weather["weather"][0]["description"]
  end

end