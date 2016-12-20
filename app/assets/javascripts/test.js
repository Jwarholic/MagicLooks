$(document).ready( function() {
  var loggedIn = 'false';
  var mirrorId = undefined;
  var ownerId = undefined;

 $('.home-page').toggle();

//   $.ajax({
//       url: "/mirrors",
//       method: 'get',
//       dataType: 'json'
//     })
//     .done(function(response) {
//       console.log(response);
//       mirrorId = response['mirror_id'].toString();
//       userId = response['user_id'].toString();
//     })

//   var logInCheck = function() {
//     $.ajax({
//       url: "/users/" + userId + "/mirrors/" + mirrorId,
//       method: 'get'
//     })
//     .done(function(response) {

//       console.log("resp:",response);

//       // response["status"] && loggedIn ? $('#header').html('Hello ' + response["user_name"]) : $('#header').empty()
//       // console.log(response["user_name"]);

//       if ( loggedIn !== response["status"] ) {
//         $('.home-page').toggle();
//         $('#header').html('Hello ' + response["user_name"]);
//         // console.log(response["user_name"]);
//         loggedIn = response["status"];
//       };
//     })
//     .error(function() {
//       console.log('error');
//     })
//   };

//   setInterval(function() {
//     logInCheck();
//     // console.log('its working');
//   }, 200);

// });
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

      if ( loggedIn != res.status ) {
        
        $('#header').empty()
        $('.home-page').toggle();
        if (res.status != "false"){
              $('#header').html('Hello ' + res.user_name);
        }
        loggedIn = res.status;
      };
    })
    .error(function() {
      console.log('error');
    })
  };

  setInterval(function() {
    logInCheck();
  }, 800);

});
