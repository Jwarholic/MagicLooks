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
    #200-299 thunder DONE
    #300-499 drizzle DONE
    #500-550 rain DONE
    #600-630 snow DONE
    #700-799 atmosphere DONE
    #800 clear DONE
    #801-804 clouds DONE
    #900-999 extreme DONE
  
    id = weather["weather"][0]["id"]
    id = 330
    if id > 800 && id < 805
        return "<div class='icon cloudy'>
                 <div class='cloud'></div>
                 <div class='cloud'></div>
               </div>"
    #THUNDER
    elsif id >= 200 && id < 300
      return "<div class='icon thunder-storm'>
                 <div class='cloud'></div>
                 <div class='lightning'>
                 <div class='bolt'></div>
                 <div class='bolt'></div>
            </div>
            </div>"
    #DRIZZLE
    elsif id >= 300 && id < 500
         return "<div class='icon sun-shower'>
      <div class='cloud'></div>
      <div class='sun'>
        <div class='rays'></div>
      </div>
      <div class='rain'></div>
    </div>"
  #RAIN
    elsif id >= 500 && id < 551
      return "<div class='icon rainy'>
        <div class='cloud'></div>
        <div class='rain'></div>
      </div>"
    elsif id >= 600 && id < 631
      return "<div class='icon flurries'>
        <div class='cloud'></div>
        <div class='snow'>
         <div class='flake'></div>
        <div class='flake'></div>
        </div>
          </div>"
    #SUNNY
    elsif id == 800
      return "<div class='icon sunny'>
        <div class='sun'>
        <div class='rays'></div>
       </div>
    </div>"
    #WARNING
  else
  	icon = weather["weather"][0]["icon"]
<<<<<<< HEAD
    p weather["weather"][0]["id"]
  	imageurl = "http://openweathermap.org/img/w/#{icon}.png"
=======
  	return "<img src='http://openweathermap.org/img/w/#{icon}.png' style='width:200px; height: 200px;'>"
>>>>>>> 48d25ba268aed4725961c4ce087809fa7d2ff116
  end
end

  #Weather temp
  def self.weathertemp
    #Converts Kelvin to Degrees / Rounds the number.
		(1.8 * (weather["main"]["temp"] - 273) + 32).ceil
  end

  #weather description
  def self.weatherdesc
  	weather["weather"][0]["description"]
  end

  def self.weatherlocation
    weather["name"]
  end

end