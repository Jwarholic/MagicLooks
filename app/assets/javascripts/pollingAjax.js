$(document).ready( function() {
  var loggedIn = 'false';
  var mirrorId = undefined;
  var ownerId = undefined;

      $('#quote').hide();
 //  setInterval(function() {
 //      GetClock();
 //      setInterval(GetClock, 1000);
 //     //Hide the name
 //     // Show the quote
 // }
      // <-- time in milliseconds


    GetClock();
    console.log(header)
    setInterval(GetClock, 1000);

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
              $('#header').show()
              var msg = new SpeechSynthesisUtterance("Hello" + res.user_name);
              window.speechSynthesis.speak(msg);
              setTimeout(function() {
                $('#header').fadeOut('fast');
                $('#quote').show();
              }, 5000);
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

