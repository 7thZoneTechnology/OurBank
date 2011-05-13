
/*
############################################################################
#  This file is part of OurBank.
############################################################################
#  OurBank is free software: you can redistribute it and/or modify
#  it under the terms of the GNU Affero General Public License as
#  published by the Free Software Foundation, either version 3 of the
#  License, or (at your option) any later version.
############################################################################
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU Affero General Public License for more details.
############################################################################
#  You should have received a copy of the GNU Affero General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
############################################################################
*/
/**to select the value of sub office when there is any changes in office type*/					


$(document).ready(
  function() {

    $('input#tmpAddRow').click(
      function() {
        var newRow = $('tr#tmp').clone(true).removeAttr('id');
        newRow.find("select").each( function() {
            $(this).children(':first').attr('selected', 'selected');
        });
        newRow.find("input:text").val("");
        newRow.find("input:checkbox").removeAttr('checked');
        newRow.find("input:hidden").removeAttr('value');
        newRow.find("input:radio").removeAttr('checked');
        newRow.appendTo('.family tbody');
        $('tr#tmp').closest('table').find('input:text.date').each(function() 
        {
            $(this).removeClass('hasDatepick').datepick({
                       dateFormat: 'dd/mm/yyyy',
                       onSelect: updateSelected,
                       parseDate:'dd/mm/yyyy',
                       commandsAsDateFormat:true,});
        });
        arrangeCheckboxNames();
        arrangeRadioNames();
        arrangedateid();
      }
    );

    $('tr input[type=text]').focus(
      function() {
        $(this).addClass('myFocused');   
      }
    ).blur(
      function() {
        $(this).removeClass('myFocused');
      }
    );

    var arrangeCheckboxNames = function() {
    var length = 1;
    $('tr#tmp').find('input:checkbox').val(length);


    length++;
    $('tr#tmp').nextAll('tr').each( function() {
    $(this).find('input:checkbox').val(length);
        length++;
    });
};


    var arrangedateid = function() { 
    var length = 1;
    $('tr#tmp').find('input.datechange').attr( 'id', 'date-'+length );
    $('tr#tmp').find('input.agechange').attr( 'id', 'age-'+length );
    $('tr#tmp').find('div.branchclass').attr( 'id', 'branchdiv-'+length );
    $('tr#tmp').find('select.bankfilter').attr( 'id', 'bank-'+length );
    length++;

    $('tr#tmp').nextAll('tr').each( function() {;
        $(this).find('input.datechange').attr( 'id', 'date-'+length );
        $(this).find('input.agechange').attr( 'id', 'age-'+length );
        $(this).find('div.branchclass').attr( 'id', 'branchdiv-'+length );
        $(this).find('select.bankfilter').attr( 'id', 'bank-'+length );
        length++;
    });
};


    var arrangeRadioNames = function() {
    var length = 1;
    $('tr#tmp').find('input:radio').val(length);
    length++;
    $('tr#tmp').nextAll('tr').each( function() {
        $(this).find('input:radio').val(length);
        length++;
    });
    };


    $('.delete-icon').click(function() {
    $(this).closest('tr').not('#tmp').remove();
//         $(this).closest('tr').remove();
        arrangeCheckboxNames();
    });

    $('.agechange').keyup(function() {
        var age = $(this).val();
        var currentdate=$('#currentdate').attr("value").split("/");
        var dobyear = currentdate[2]-age;
        var dob = currentdate[0]+'/'+currentdate[1]+'/'+dobyear;
        var id=$(this).attr("id").split("-");
        $('#date-'+id[1]).val(dob);
    });

    $('.bankfilter').change(function() {
        var id=$(this).attr("id").split("-");
        if($(this).val())
        {  bank_id=$(this).val();
           path=$('#baseurl').val();
           targeturl=path+"/familymembers/index/getbranch?bank_id="+bank_id;
	   $.ajax({ url: targeturl, success: function(data){ $('#branchdiv-'+id[1]).html(data) }});
        }
    });

    $('.date').datepick({
     format: 'dd/mm/yyyy',
     onSelect: updateSelected,
    });

    function updateSelected(date) {
            var id=$(this).attr("id").split("-");
            dob = new Date($(this).datepick('getDate')[0]);
            var today = new Date();
            var age = Math.floor(Math.ceil(today - dob) / (1000 * 60 * 60 * 24 * 365));
            $('#age-'+id[1]).val(age);
     }

    $('#pluginForm').submit(function(e) {
        $(this).find(':text.required').each(function() {
            if($(this).val().replace(/^\s+|\s+$/g,"") == "") {
                if($(this).next('span').length == 0 )
                    $(this).after('<span style="color: #FF0000">Field is required</span>');
                e.preventDefault();
                return;
            } else {
                if($(this).next('span').length > 0 )
                    $(this).next('span').remove();
            }
        });

     $(this).find(':select.selectvalid').each(function() {
            if($(this).val() == 0) {
                if($(this).next('span').length == 0 ){
                    $(this).after('<span style="color: #FF0000">Field is required</span>');
                e.preventDefault();
                return;
                }
             }   else {
                if($(this).next('span').length > 0 )
                    $(this).next('span').remove();
                }
        });

        $(this).find(':text.numeric').each(function() {
           var regex = new RegExp(/^[1-9][0-9]*$/);
           if(!regex.test($(this).val()) && $(this).val() != "") {
               if($(this).next('span').length == 0 ) {
                  $(this).after('<span style="color: #FF0000">Numeric Data allowed only.</span>');
               }
               e.preventDefault();
               return;
           } else {
                   $(this).next('span').remove();
           }
       });


    });
});
