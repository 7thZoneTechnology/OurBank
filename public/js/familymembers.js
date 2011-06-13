
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
        valueselect = newRow.find("select").val();
        if(valueselect!=0){
            newRow.find("select").val(0);
        }
        newRow.find("input:text").val("");
        newRow.find("input:checkbox").removeAttr('checked');
        newRow.find("input:checkbox").removeAttr('disabled');
        newRow.find("input:hidden").removeAttr('value');
        newRow.find("input:radio").removeAttr('checked');
        newRow.find('span').remove();
        newRow.appendTo('.family tbody');
        $('tr#tmp').closest('table').find('input:text.date').each(function() 
        {
            $(this).removeClass('hasDatepick').datepick({
                       dateFormat: 'dd/mm/yyyy',
                       onSelect: updateSelected,
                       parseDate:'dd/mm/yyyy',
                       commandsAsDateFormat:true,
                        maxDate: '+0D',});
        });
        arrangeRadioNames();
        arrangedateid();
//         arrangecheckbox();
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


    $(".entitleid1").click ( function() {
         var entitlename=$(this).attr("name").split("-"); 
        if($(".entitlenone-"+entitlename[1]).is(':checked')) {
                $(".entitlevalid-"+entitlename[1]).attr ( "disabled" , true );
		$(".entitlevalid-"+entitlename[1]).removeAttr('checked');
        } else {
                $(".entitlevalid-"+entitlename[1]).attr ( "disabled" , false );
        }
    });


    $(".entitleid").click ( function() {
         var entitlename=$(this).attr("name").split("-"); 
        if($(".entitlevalid-"+entitlename[1]).is(':checked')) {
                $(".entitlenone-"+entitlename[1]).attr ( "disabled" , true );
		$(".entitlenone-"+entitlename[1]).removeAttr('checked');
        } else {
                $(".entitlenone-"+entitlename[1]).attr ( "disabled" , false );
        }
    });

    $(".uidvalid").change( function() {
	var id=$(this).attr("id").split("-"); 
        if($(this).val())
        {  uid=$(this).val();
           path=$('#baseurl').val();
           targeturl=path+"/familymembers/index/checkuid?uid="+uid+"&hiddenid="+id[1]; //alert(targeturl);
	   $.ajax({ url: targeturl, success: function(data){ $('#uiddiv-'+id[1]).html(data) }});
        }
// 	alert($('#hiddenuid-'+id[1]).val());
    }); 

    $(".uidvaltext").change( function() {
	var id=$(this).attr("id").split("-");
        var uidvalue = $(this).val();
        habitfields = $("input[name='uid"+"[]']").serializeArray(); 
        len = habitfields.length; //alert(len);
        for(i=1; i<=len; i++){ //alert(i);
        if(i!=id[1]){
        if($('#uid-'+i).val()!=uidvalue)
        {
            $(this).next('span#uidmember').remove();
        }
        else
        {
            $(this).after('<span id="uidmember" style="color: #FF0000">UID repeating</span>');
            return false;
        }
        }
        }
    });


    $(".profid1").click ( function() {
         var entitlename=$(this).attr("name").split("-"); 
        if($(".profidnone-"+entitlename[1]).is(':checked')) {
                $(".profidvalid-"+entitlename[1]).attr ( "disabled" , true );
		$(".profidvalid-"+entitlename[1]).removeAttr('checked');
        } else {
                $(".profidvalid-"+entitlename[1]).attr ( "disabled" , false );
        }
    });

    $(".profid").click ( function() {
         var entitlename=$(this).attr("name").split("-"); 
        if($(".profidvalid-"+entitlename[1]).is(':checked')) {
                $(".profidnone-"+entitlename[1]).attr ( "disabled" , true );
		$(".profidnone-"+entitlename[1]).removeAttr('checked');
        } else {
                $(".profidnone-"+entitlename[1]).attr ( "disabled" , false );
        }
    });

    var arrangedateid = function() {
    var length = 1;
    $('tr#tmp').find('input.datechange').attr( 'id', 'date-'+length );
    $('tr#tmp').find('input.agechange').attr( 'id', 'age-'+length );
    $('tr#tmp').find('div.branchclass').attr( 'id', 'branchdiv-'+length );
    $('tr#tmp').find('select.bankfilter').attr( 'id', 'bank-'+length );
    $('tr#tmp').find('div.cboclass').attr( 'id', 'cbodiv-'+length );
    $('tr#tmp').find('div.bankclass').attr( 'id', 'bankdiv-'+length );
    $('tr#tmp').find('div.uidclass').attr( 'id', 'uiddiv-'+length );
    $('tr#tmp').find('select.cbofilter').attr( 'id', 'cbopromoter-'+length );
    $('tr#tmp').find('select.findbank').attr( 'id', 'accounttype-'+length );
    $('tr#tmp').find('select.interest').attr( 'id', 'source-'+length );
    $('tr#tmp').find('input.uidvalid').attr('id', 'uid-'+length);
    $('tr#tmp').find('input.disableid').attr( 'id', 'disable-'+length );
    $('tr#tmp').find('input.disableamt').attr( 'id', 'amtdisable-'+length );
    $('tr#tmp').find('input.entitleid').attr( 'name', 'entitle-'+length+'-[]');
    $('tr#tmp').find('input.entitleid1').attr( 'name', 'entitle-'+length+'-[]');
    $('tr#tmp').find('input.entitleid1').attr( 'class', 'entitleid1 entitlenone-'+length);
    $('tr#tmp').find('input.entitleid').attr( 'class', 'entitleid entitlevalid-'+length);

    $('tr#tmp').find('input.profid').attr( 'name', 'profid-'+length+'-[]');
    $('tr#tmp').find('input.profid1').attr( 'name', 'profid-'+length+'-[]');
    $('tr#tmp').find('input.profid1').attr( 'class', 'profid1 profidnone-'+length);
    $('tr#tmp').find('input.profid').attr( 'class', 'profid profidvalid-'+length);
    length++;

    $('tr#tmp').nextAll('tr').each( function() {
        $(this).find('input.datechange').attr( 'id', 'date-'+length );
        $(this).find('input.agechange').attr( 'id', 'age-'+length );
        $(this).find('div.branchclass').attr( 'id', 'branchdiv-'+length );
        $(this).find('select.bankfilter').attr( 'id', 'bank-'+length );
        $(this).find('div.cboclass').attr( 'id', 'cbodiv-'+length );
        $(this).find('div.bankclass').attr( 'id', 'bankdiv-'+length );
    	$(this).find('div.uidclass').attr( 'id', 'uiddiv-'+length );
        $(this).find('select.cbofilter').attr( 'id', 'cbopromoter-'+length );
        $(this).find('select.findbank').attr( 'id', 'accounttype-'+length );
        $(this).find('select.interest').attr('id', 'source-'+length);
        $(this).find('input.disableid').attr('id', 'disable-'+length);
        $(this).find('input.disableamt').attr('id', 'amtdisable-'+length);
        $(this).find('input.uidvalid').attr('id', 'uid-'+length);
        $(this).find('input.entitleid').attr( 'name', 'entitle-'+length+'-[]');
        $(this).find('input.entitleid1').attr( 'name', 'entitle-'+length+'-[]');
    	$(this).find('input.entitleid1').attr( 'class', 'entitleid1 entitlenone-'+length);
        $(this).find('input.entitleid').attr( 'class', 'entitleid entitlevalid-'+length);

	$(this).find('input.profid').attr( 'name', 'profid-'+length+'-[]');
	$(this).find('input.profid1').attr( 'name', 'profid-'+length+'-[]');
	$(this).find('input.profid1').attr( 'class', 'profid1 profidnone-'+length);
	$(this).find('input.profid').attr( 'class', 'profid profidvalid-'+length);
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
        var age = $(this).val(); //alert(age);
        var id=$(this).attr("id").split("-");
        if(age<=120){
        $(this).next('span').remove();
        var currentdate=$('#currentdate').attr("value").split("/");
        var dobyear = currentdate[2]-age;
        var dob = currentdate[0]+'/'+currentdate[1]+'/'+dobyear;
        $('#date-'+id[1]).val(dob);
        }
        else {
            $(this).after('<span style="color: #FF0000">Age less than 120</span>');
            $('#date-'+id[1]).val('');
        }
    });

    $('.interest').change(function() {
        var id=$(this).attr("id").split("-");
        var selectvalue=$(this).val();
        if(selectvalue==2){
        $('#disable-'+id[1]).hide(); 
        $('#disable-'+id[1]).removeAttr('value');
        }
        else{
        $('#disable-'+id[1]).show();
        }

        if(selectvalue==6){
        $('#amtdisable-'+id[1]).hide();
        $('#amtdisable-'+id[1]).removeAttr('value');
        }
        else{
        $('#amtdisable-'+id[1]).show();
        }
    })

    $('.bankfilter').change(function() {
        var id=$(this).attr("id").split("-");
        if($(this).val())
        {  bank_id=$(this).val();
           path=$('#baseurl').val();
           targeturl=path+"/familymembers/index/getbranch?bank_id="+bank_id;
	   $.ajax({ url: targeturl, success: function(data){ $('#branchdiv-'+id[1]).html(data) }});
        }
    });

    $('.cbofilter').change(function() {
        var id=$(this).attr("id").split("-");
        if($(this).val())
        {  cbo_id=$(this).val();
           path=$('#baseurl').val();
           targeturl=path+"/familymembers/index/getcbo?cbo_id="+cbo_id;
	   $.ajax({ url: targeturl, success: function(data){ $('#cbodiv-'+id[1]).html(data) }});
        }
    });

    $('.findbank').change(function(){
        var id=$(this).attr("id").split("-");
        if($(this).val())
        {  type_id=$(this).val();
           path=$('#baseurl').val();
           targeturl=path+"/familymembers/index/getbank?type_id="+type_id+"&divid="+id[1];
	   $.ajax({ url: targeturl, success: function(data){ $('#bankdiv-'+id[1]).html(data) }});
        }
    });

    $('.date').datepick({
     format: 'dd/mm/yyyy',
     onSelect: updateSelected,
     maxDate: '+0D',
    });

    function updateSelected(date) {
            var id=$(this).attr("id").split("-");
            dob = new Date($(this).datepick('getDate')[0]);
            var today = new Date();
            var age = Math.floor(Math.ceil(today - dob) / (1000 * 60 * 60 * 24 * 365));
            $('#age-'+id[1]).val(age);
     }

    $('#pluginForm').submit(function(e) {
        $(this).find('.required').each(function() {
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

     $(this).find(':text.noncharacters').each(function() {
          var regex = new RegExp(/^[a-zA-Z\ \']+$/);
          if(!regex.test($(this).val()) && $(this).val() != "") {
              if($(this).next('span').length == 0 ) {
                 $(this).after('<span id="charid" style="color: #FF0000"><br>Alphabets only allowed</span>');
              }
              e.preventDefault();
              return;
          } else {
                  $(this).next('span#charid').remove();
          }
      });

        $(this).find(':text.numeric').each(function() {
           var regex = new RegExp(/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/);
           if(!regex.test($(this).val()) && $(this).val() != "") {
               if($(this).next('span').length == 0 ) {
                  $(this).after('<span style="color: #FF0000" id="numberspan">Numeric data only allowed</span>');
               }
               e.preventDefault();
               return;
           } else {
                   $('span#numberspan').next('span').remove();
           }
       });


    });
});
