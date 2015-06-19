$(document).ready(function(){
	$('.category').each(
		function(){

			$(this).bind (
            	"click",(function(){

            		var type = $(this).attr('type')
            		var categoryid = $(this).attr('value')
            		var innertext = $(this).text()
		

		    		$('.will-hide').attr('value', type)
		    		$('.will-hide2').attr('value', categoryid)
		    		$('#dLabel').text(innertext)




				})
			)


		}
	)

	$('.subcategory').each(
		function(){

			$(this).bind (
				"click",(function(){

					var type = $(this).attr('type')
					var subcategoryid = $(this).attr('value')
					var innertext = $(this).text()
					
					$('.will-hide').attr('value', type)
		    		$('.will-hide2').attr('value', subcategoryid)
		    		$('#dLabel').text(innertext)

				})
			)

		}
	);
})
	