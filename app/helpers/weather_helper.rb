module WeatherHelper

def self.weather
        #Get location of the IP user
        response = HTTParty.get("http://ip-api.com/json")
        # lon = response["lon"]
        # lat = response["lat"]
        key = ENV['WEATHER']


        #Call the weather api for the results.
        weather = "http://api.openweathermap.org/data/2.5/weather?lat=37.77&lon=-122.42&appid=#{key}&units=imperial"
        results = HTTParty.get(weather)
 end


  #GET THE ICON FOR THE CURRENT WEATHER.
  def self.weatherimage
    #200-299 thunder DONE
    #300-499 drizzle DONE
    #500-550 rain DONE
    #600-630 snow DONE
    #700-799 atmosphere DONE ON DEFAULT.
    #800 clear DONE
    #801-804 clouds DONE
    #900-999 extreme DONE
    p weather
    p '*************************************************'
    weather_id = weather["weather"][0]["id"]
    if weather_id > 800 && weather_id < 805 || weather_id >= 700 && weather_id < 800
      return "
        <div class='icon cloudy'>
        <div class='cloud'></div>
        <div class='cloud'></div>
        </div>"
    #THUNDER
    elsif weather_id >= 200 && weather_id < 300
      return "
        <div class='icon thunder-storm'>
        <div class='cloud'></div>
        <div class='lightning'>
        <div class='bolt'></div>
        <div class='bolt'></div>
        </div>
        </div>"
    #DRIZZLE
    elsif weather_id >= 300 && weather_id < 500
      return "
        <div class='icon sun-shower'>
        <div class='cloud'></div>
        <div class='sun'>
        <div class='rays'></div>
        </div>
        <div class='rain'></div>
        </div>"
    #RAIN
    elsif weather_id >= 500 && weather_id < 551
      return "
        <div class='icon rainy'>
        <div class='cloud'></div>
        <div class='rain'></div>
        </div>"
    elsif weather_id >= 600 && weather_id < 631
      return "
        <div class='icon flurries'>
        <div class='cloud'></div>
        <div class='snow'>
         <div class='flake'></div>
        <div class='flake'></div>
        </div>
        </div>"
    #SUNNY
    elsif weather_id == 800
      return "
        <div class='icon sunny'>
        <div class='sun'>
        <div class='rays'></div>
        </div>
        </div>"
    #WARNING
  else
  	icon = weather["weather"][0]["icon"]
  	imageurl = "http://openweathermap.org/img/w/#{icon}.png"
  	return "<img src='http://openweathermap.org/img/w/#{icon}.png' style='width:200px; height: 200px;'>"
  end
end

  #Weather temp
  def self.weathertemp
    weather["main"]["temp"].round(1)
  end

  #weather description
  def self.weatherdesc
  	weather["weather"][0]["description"]
  end

  def self.weatherlocation
    weather["name"]
  end

  def self.quote(category_name)
      uri = URI.parse("http://quotes.rest/quote/search.json?category=#{category_name}")

      request = Net::HTTP::Get.new(uri)
      request["X-Theysaidso-Api-Secret"] = ENV['QUOTES']
      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
        http.request(request)
      end
      JSON.parse(response.body)['contents']['quote']
  end

end