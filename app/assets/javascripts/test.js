// $(document).ready( function() {
//   var loggedIn = 'false';
//   var mirrorId = undefined;
//   var userId = undefined;

//   $('.home-page').hide();
  

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
