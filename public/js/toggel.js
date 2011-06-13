$(document).ready(function(){
	
	$(".toggle_container").hide();

	$("h2.trigger").click(function(){
		$(this).toggleClass("active").next().slideToggle("slow");
	});

});
function unhide(obj,div)
{
    if(document.getElementById(obj).style.display=='none') {
        document.getElementById(obj).style.display='block';
    } else {
        document.getElementById(obj).style.display='none';
    }
    if(document.getElementById(div).style.display=='block') {
        document.getElementById(div).style.display='none';
    } else {
        document.getElementById(div).style.display='block';
    }

}
$(document).ready(function(){
	        //iterate through each textboxes and add keyup
        //handler to trigger sum event
	        $(".txt").each(function() {
 	            $(this).keyup(function(){
                calculateSum();
	            });
	        });
	    });
	    function calculateSum() {
	        var sum = 0;
	        //iterate through each textboxes and add the values
	        $(".txt").each(function() {
	 	            //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
	                sum += parseFloat(this.value);
           }
	        });
	        //.toFixed() method will roundoff the final sum to 2 decimal places
	        $(".amount1").val(sum.toFixed(2)); 
	    }

