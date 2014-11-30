
var tableClicker = function() {
	$('#request-list tr').click(function (event) {
		var id = $(this).data('value');
		$('tr').css({"backgroundColor": "#ffffff"});
		
		if($("#block"+id).hasClass("out")) {
			
			$(".collapse").removeClass("in");
			$(".collapse").addClass("out");
			$("#block"+id).addClass("in");
			$("#block"+id).removeClass("out");
			$(this).css({"backgroundColor": "#e9ebed"});
			$("#block"+id).css({"backgroundColor": "#e9ebed"});

		} else {
			$("#block"+id).addClass("out");
			$("#block"+id).removeClass("in");
		}

	});

	$('#request-tabs li').click(function (event){
		$('#request-tabs li').removeClass("active");
		$(this).addClass("active");

		$(".collapse").removeClass("in");
		$(".collapse").addClass("out");

		if ( $(this).attr('id') == 'pending-tab') {
			$('.accepted').hide();
			$('.pending').show();
		} else {
			$('.pending').hide();
			$('.accepted').show();
		}
	});
}

$(document).ready(tableClicker);