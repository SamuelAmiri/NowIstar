$(document).ready(function(){
	$('.category').each(
		function(){

			$(this).bind (
            	"click",(function(){

            		var type = $(this).attr('type')
            		var categoryid = $(this).attr('value')
            		var innertext = $(this).text()

            		alert(categoryid)
            		alert(type)
		    		$('#dLabel').text(innertext)
		    		$('#dLabel').attr('type', type)
		    		$('#dLabel').attr('categoryid', categoryid)



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
					$('#dLabel').text(innertext)
				})
			)

		}
	);
})
	