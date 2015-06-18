$(document).ready(function(){
	$('.category').each(
		function(){

			$(this).bind (
            	"click",(function(){


            	var innertext = $(this).text()

		    	$('#dLabel').text(innertext)

				}));



			$('.subcategory').click(function(){

				alert("test")

			});
		}
	)

});