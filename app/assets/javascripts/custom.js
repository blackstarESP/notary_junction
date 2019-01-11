document.body.addEventListener('ajax:error', function(event) {
  var detail = event.detail;
  var data = detail[0], status = detail[1], xhr = detail[2];

  var errorArray = JSON.parse(xhr.responseText);
  var output = "<ul class='registration-error-list'>"; // Open list
  var i;

  // Loop through the artists, and add them as list items
  for (var i in errorArray) {
  	output += "<li>" + errorArray[i] + "</li>"; 
  }

	output += "</ul>"; // Close list
    document.getElementById("registration-errors").innerHTML = output;
})