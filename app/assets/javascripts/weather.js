tday = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday",
    "Friday", "Saturday");
tmonth = new Array("January", "February", "March", "April", "May", "June", "July",
    "August", "September", "October", "November", "December");

function GetClock() {
    var d = new Date();
    var nday = d.getDay(),
        nmonth = d.getMonth(),
        ndate = d.getDate(),
        nyear = d.getYear();

    if (nyear < 1000) nyear += 1900;

    var nhour = d.getHours(),
        nmin = d.getMinutes(),
        nsec = d.getSeconds(),
        ap;

    if (nhour == 0) {
        ap = " AM";
        nhour = 12;
    } else if (nhour < 12) {
        ap = " AM";
    } else if (nhour == 12) {
        ap = " PM";
    } else if (nhour > 12) {
        ap = " PM";
        nhour -= 12;
    };

    if (nmin <= 9) nmin = "0" + nmin;
    if (nsec <= 9) nsec = "0" + nsec;
    document.getElementById('clockbox').innerHTML = nhour + ":" + nmin + ":" + nsec + ap + "";
}

var header = document.getElementById('header');

// window.onload = function() {
    // GetClock();
    // console.log(header);
    // setInterval(GetClock, 1000);
    // var header = document.getElementById('header');
    // var msg = new SpeechSynthesisUtterance($(header).text());
    // window.speechSynthesis.speak(msg);
// };
 window.onload = function() {
      $('#quote').hide();
      GetClock();
      setInterval(GetClock, 1000);
     //Hide the name
     // Show the quote
     setTimeout(function() {
     $('#header').fadeOut('fast');
     $('#quote').show();
 }, 5000); // <-- time in milliseconds
 }