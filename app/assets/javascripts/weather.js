 $(document).ready(function(){
  var lat, long;
  $.getJSON("http://ip-api.com/json",function(location){
    lat = location.lat
    long = location.lon
    $('body').append("lat: ", lat)
    $('body').append("<br>")
    $('body').append("long: ", long)
    $('body').append("<br>")
    var key = "0b00512afd38eb31d828e615774a2fd4"
    var weatherUrl = "http://api.openweathermap.org/data/2.5/weather?lat=" 
    + lat + "&lon=" + long + "&appid=" + key
    
    $.getJSON(weatherUrl,function(data){
    $('body').append(data.weather[0].description)
    var icon = data.weather[0].icon
    // <img id="weatherImg" src="http://openweathermap.org/img/w/" + icon + ".png"/>
    $('body').append('<img id="weatherImg" src="http://openweathermap.org/img/w/'+icon+'.png"/>')
    console.log("http://openweathermap.org/img/w/" + icon + ".png")
      
    })

  })

});