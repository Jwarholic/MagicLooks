$(document).ready( function() {
  var loggedIn = 'false';
  var mirrorId = undefined;
  var userId = undefined;
  var userName = undefined;

  $('.home-page').toggle();

  $.ajax({
      url: "/mirrors",
      method: 'get',
      dataType: 'json'
    })
    .done(function(response) {
      mirrorId = response['mirror_id'];
      userId = response['user_id'];
      userName = response['user_name'];
    })

  var logInCheck = function() {
    $.ajax({
      url: "/users/" + userId + "/mirrors/" + mirrorId,
      method: 'get'
    })
    .done(function(response) {

      console.log("resp:",response);

      if ( loggedIn != response ) {
        $('.home-page').toggle();
        console.log(userName);
        $('#header').append('Hello ' + userName);
        loggedIn = response;
      };
    })
    .error(function() {
      console.log('error');
    })
  };

  setInterval(function() {
    logInCheck();
    console.log('its working');
  }, 2000);

});

// mirror/login

// 