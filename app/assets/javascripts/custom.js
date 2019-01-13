$(".registrations new").ready(function() {
  addEventListener('ajax:error', function(event) {
	  var detail = event.detail;
	  var data = detail[0], status = detail[1], xhr = detail[2];

	  var errorArray = JSON.parse(xhr.responseText);
	  var output = "<ul class='registration-error-list'>";

	  for (var error in errorArray) {
	  	output += "<li>" + errorArray[error] + "</li>"; 
	  }

	  output += "</ul>";
	  document.getElementById("registration-errors").innerHTML = output;
	});
});
