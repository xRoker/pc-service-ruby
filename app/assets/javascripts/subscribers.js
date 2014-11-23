//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/

var main = function(){
	$("#subscribe-box").change( function() {
		if(this.checked) {
			$.post("/subscribe");
		}

		else {
			$.post("/unsubscribe");
		}
	})
}

$(document).ready(main)