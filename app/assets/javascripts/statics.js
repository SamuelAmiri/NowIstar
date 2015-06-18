$(document).ready(function(){
	$('.category').each(
		function(){

			$(this).bind (
            	"click",(function(){


            		var innertext = $(this).text()

		    		$('#dLabel').text(innertext)

				})
			)


		}
	)

	$('.subcategory').each(
		function(){

			$(this).bind (
				"click",(function(){
					var innertext = $(this).text()
					$('#dLabel').text(innertext)
				})
			)

		}
	);
})
	