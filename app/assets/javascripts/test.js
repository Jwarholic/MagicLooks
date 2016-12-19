$(document).ready( function() {
  var loggedIn = false;
  
  var logInCheck = function() {
    $.ajax({
      url: "/users/#{current_user}/mirrors/#{session[:mirror_id]}",
      method: 'get',
      dataType: 'json'
    })
    .done(function(response) {
      // var textResponse = $(response).text();
      console.log(response);
      // if (textResponse !==  "nobody by the mirror") {
      //   loggedIn = true;
      // };
    })
    .error(function() {
      console.log('error');
    })
  };

  // setInterval(function() {
    // logInCheck();
    console.log('its working');
  // }, 2000);

});

// mirror/login

// 