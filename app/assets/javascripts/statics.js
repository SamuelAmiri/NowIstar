$(document).ready(function(){
	$('.category').each(
		function(){

			$(this).bind (
            	"click",(function(){


            	var innertext = $(this).text()
		    	var press = $(this).prop('name');


		    	alert(innertext)


				}));



			$('.subcategory').click(function(){

				alert("test")

			});
		}
	)

});