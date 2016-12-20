$(document).ready( function() {
  var loggedIn = false;

  $.ajax({
      url: "/mirrors",
      method: 'get',
      dataType: 'json'
    })
    .done(function(response) {
      var mirror = response;
    })

  var logInCheck = function() {
    $.ajax({
      url: "/users/2/mirrors/2",
      method: 'get'
    })
    .done(function(response) {
      var textResponse = $(response).text();

      console.log(response);
      console.log('hs');
      if (textResponse !==  undefined) {
        loggedIn = true;
      };
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