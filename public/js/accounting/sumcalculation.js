$(document).ready(function(){
        //iterate through each textboxes and add keyup
        //handler to trigger sum event
        $(".txt").each(function() {
        $(this).keyup(function(){
        calculateSum();
        calculateMarks();
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
        $(".amount").val(sum.toFixed(2)); 
    } 

    function calculateMarks() {
        var marks = 0;
        //iterate through each textboxes and add the values
        $(".txt").each(function() {
        //add only if the value is number
            if(!isNaN(this.value) && this.value.length!=0) {
            var name = this.name;
            name = name+'V';
            val = $('input[name='+ name +']').val();
            marks += parseFloat(val);
           }
        });
        //.toFixed() method will roundoff the final sum to 2 decimal places
        $(".marks").val(marks.toFixed(2)); 
calculatePercentage();

    }

    function calculatePercentage(){
            var maxmark,obtainmark,per,grade;
            maxmark = $('input[name = totalmarks]').val();
            obtainmark  = $('input[name = marks]').val();
            per = maxmark/obtainmark*100;
        $(".percentage").val(per.toFixed(2)); 
        if(per > 80)
            {
            grade = 'A';
        }
       else if(per > 70 && per < 80)
            {
             grade = 'B';
        }
       else if(per > 60 && per < 70)
            {
            grade = 'C';
        }
       else if(per < 60)
            {
            grade = 'D';
        }
       $(".grade").val(grade);

//     alert(per);
    
    }
 