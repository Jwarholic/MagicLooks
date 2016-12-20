$(document).ready( function() {
  var loggedIn = 'false';
  var mirrorId = undefined;
  var ownerId = undefined;

  $('.home-page').hide();
  

  $.ajax({
      url: "/mirrors",
      method: 'get',
      dataType: 'json'
    })
    .done(function(response) {
      console.log(response);
      mirrorId = response['mirror_id'];
      ownerId = response['user_id'];
    }).fail(function(){
      console.log("its fails!!!!")
    })

  var logInCheck = function() {
    $.ajax({
      url: "/users/" + ownerId + "/mirrors/" + mirrorId,
      method: 'get'
    })
    .done(function(response) {

      var res = JSON.parse(response)
      console.log("resp:",res.status);

      // response["status"] && loggedIn ? $('#header').html('Hello ' + response["user_name"]) : $('#header').empty()
      // console.log(response["user_name"]);

      if ( loggedIn != res.status ) {
        
        $('#header').empty()
        $('.home-page').toggle();
        if (res.status != "false"){
          console.log(res.user_name)
              $('#header').html('Hello ' + res.user_name);
        }
        // console.log(response["user_name"]);
        loggedIn = res.status;
      };
    })
    .error(function() {
      console.log('error');
    })
  };

  setInterval(function() {
    logInCheck();
    // console.log('its working');
  }, 800);

});
