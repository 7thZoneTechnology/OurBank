$(document).ready(
  function() {
    $('input#tmpAddRow').click(
      function() {
      tableobj=$(this).parent();
        selectedval=[];
      rowindex=$('tr',tableobj).length;
      trobjec=$('tr',tableobj);
       $('tr',tableobj).each(function (index, domEle) {
           if(index!=rowindex && index!=0)
             {
              sval=$("#select"+index).selectedValues();
               selectedval.push(sval);
            }
        });
       var newRow = $('tr#tmp').clone(true).removeAttr('id');
                selectobj=newRow.find("select");
                newrowobj=$(this).children(':first');
                inputobj=newRow.find("input:text");
                inputobj.val("");
                newRow.find('span').remove();
//                 selectobj.val("");

        newRow.appendTo('.asset tbody');
        $(selectobj).attr('id', 'select'+rowindex);
             trobjec.each(function (index, domEle) {
                   if(index!=0 && index!=rowindex)
                     {
                      sval=$("#select"+index).selectedValues();
                    $("#select"+rowindex+" option[value='"+sval+"']").remove();
            
                }
       });
        
           $('tr#tmp').closest('table').find('input:text.date').each(function() {
           $(this).removeClass('hasDatepick').datepick({dateFormat: 'dd/mm/yyyy',maxDate : '+0D',});
        });
      }
    );

  $('.select').change(function(){
            if($(this).val() == 'Select'){
                    $(this).after('<span style="color: #FF0000"><br>Choose proper Asset</span>');
            } else {
                    $(this).next('span').remove();
            }
    });


     $('tr input[type=text]').focus(
      function() {
        $(this).addClass('myFocused');
      }
    ).blur(
      function() {
        $(this).removeClass('myFocused');
      }
    );
        $(".date").datepick("option",{dateFormat: 'dd/mm/yyyy', maxDate : '+0D', });
        $(".dates").datepick({dateFormat: 'dd/mm/yyyy' });

 

    $('.delete-icon').click(function() {
        $(this).closest('tr').not('#tmp').remove();
    });
  });
$(document).ready(function() {
    $('#pluginFormlive').submit(function(e) {
        var isValid = true;
        $(this).find(':text.required').each(function() {
            if($(this).val().replace(/^\s+|\s+$/g,"") == "") {
                isValid = false;
                if($(this).next('span').length == 0 ) {
                    $(this).after('<span style="color: #FF0000"><br>Field is required</span>');
                }
                e.preventDefault();
                return;
            } else {
                if($(this).next('span').length > 0 )
                    $(this).next('span').remove();
            }
        });

        $(this).find(':select.select').each(function() {
            if($(this).val() == 'Select'){
                        if($(this).next('span').length == 0 ) {
                    $(this).after('<span style="color: #FF0000"><br>Field is required</span>');
                }
                e.preventDefault();
                return;            } else {
                        if($(this).next('span').length > 0 )
                    $(this).next('span').remove();            }
        });
        $(this).find(':text.numeric').each(function() {

            var regex = new RegExp(/^[0-9]*$/);
            if(!regex.test($(this).val()) && ($(this).val()!= '')) {
                if($(this).next('span').length == 0 ) {
                   $(this).after('<span style="color: #FF0000"><br>Numeric data only.</span>');
                }
                e.preventDefault();
                return;
            }  else { 
                if($(this).next('span').length >=0  && isValid)
                    $(this).next('span').remove();
            }
        }); 
    });
});