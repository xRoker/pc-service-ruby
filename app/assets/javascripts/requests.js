
var tableClicker = function() {
	$('#request-list tr').click(function (event) {
		var id = $(this).data('value');
		
		if($("#block"+id).hasClass("out")) {
			
			$(".collapse").removeClass("in");
			$(".collapse").addClass("out");
			$("#block"+id).addClass("in");
			$("#block"+id).removeClass("out");
			
		} else {
			$("#block"+id).addClass("out");
			$("#block"+id).removeClass("in");
		}

	});
}
$(document).ready(tableClicker)