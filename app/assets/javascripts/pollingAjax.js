$(document).ready( function() {
  var loggedIn = 'false';
  var mirrorId = undefined;
  var ownerId = undefined;

 $('.home-page').toggle();

  $.ajax({
      url: "/mirrors",
      method: 'get',
      dataType: 'json'
    })
    .done(function(response) {
      mirrorId = response['mirror_id'];
      ownerId = response['owner_id'];
    })
    .fail(function(err){
      console.log(err);
    })

  var logInCheck = function() {
    $.ajax({
      url: "/users/" + ownerId + "/mirrors/" + mirrorId,
      method: 'get'
    })
    .done(function(response) {
      var res = JSON.parse(response);

      if ( loggedIn != res.status ) {
        $('#header').empty()
        $('.home-page').toggle();
              $('#header').html('Hello ' + res.user_name);
        loggedIn = res.status;
      };

    })
    .error(function(err) {
      console.log(err);
    })

  };
  
  setInterval(function() {
    logInCheck();
  }, 800);

});
