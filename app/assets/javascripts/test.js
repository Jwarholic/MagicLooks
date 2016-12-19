$(document).ready( function() {
  var loggedIn = false;
  console.log('hey');

    $.ajax({
      url: "/users/1/mirrors/1",
      method: 'get'
    })
    .done(function(response) {
      console.log(response);
      if (response) {
        loggedIn = true;
        console.log(loggedIn);
      } else {
        console.log('mothaflocka');
      };
    });
});