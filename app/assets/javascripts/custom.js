$(document).ready(function () {
    // will call refreshPartial every 3 seconds
    setInterval(refreshPartial, 1000)

});

function refreshPartial() {
  $.ajax({
    url: "localhost:3000/personals";
 })
}

  // $(function() {
  //   $(document).ready(function() {
  //     setInterval(function() {
  //       jQuery.ajax({
  //         url: "localhost:3000/personal",
  //         type: "GET",
  //         dataType: "script"
  //       });
  //     }, 1000); // In every 30 seconds
  //   });
  // });
