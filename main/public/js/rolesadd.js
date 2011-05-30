    $(document).ready(function() {
    $('.mainmoduleClass').click(function(){
            ModuleId=$(this).val();
            subModchkName='submodule_'+ModuleId;
            curVal=$(this).attr('checked'); //Make it as enable
            subModObj=$('input[name='+subModchkName+']') //object for submodule 
            subModObj.attr('checked',curVal);
            subModObj.each(function(i) {
            actId=$(this).val();
                actchkNameadd='add_'+ModuleId+'_'+actId; 
                actchkNameedit='edit_'+ModuleId+'_'+actId; 
                actchkNameview='view_'+ModuleId+'_'+actId; 
                actchkNamedelete='delete_'+ModuleId+'_'+actId;
                $('input[name='+actchkNameadd+']').attr('checked',curVal);
                $('input[name='+actchkNameedit+']').attr('checked',curVal);
                $('input[name='+actchkNameview+']').attr('checked',curVal);
                $('input[name='+actchkNamedelete+']').attr('checked',curVal);
            });
    });

    $('.submoduleClass').click(function(){
        Submoduleid=$(this).val();
        clickedName=$(this).attr('name');
        ModuleId=clickedName.split('_')[1];
        curVal=$(this).attr('checked');
                actchkNameadd='add_'+ModuleId+'_'+Submoduleid; 
                actchkNameedit='edit_'+ModuleId+'_'+Submoduleid; 
                actchkNameview='view_'+ModuleId+'_'+Submoduleid; 
                actchkNamedelete='delete_'+ModuleId+'_'+Submoduleid;
                $('input[name='+actchkNameadd+']').attr('checked',curVal);
                $('input[name='+actchkNameedit+']').attr('checked',curVal);
                $('input[name='+actchkNameview+']').attr('checked',curVal);
                $('input[name='+actchkNamedelete+']').attr('checked',curVal);
                subModObj=$('input[name='+clickedName+']')
                    mcurVal=false;
                    subModObj.each(function(i) {
                    if($(this).attr('checked')){
                        mcurVal=true;
                                }
                    });
                    moduleChkName = 'mainModule_'+ModuleId; 
                    Mainmoduleobj = $('input[name='+moduleChkName+']').attr('checked',mcurVal);;
    });

    $('.activityClass').click(function(){

       clickedName=$(this).attr('name');
// alert(clickedName);

//                 modId='#submodule_'+clickedName.split('_')[1];
// 
//  

    if ( $("#clickedName").( ":checked" ) )
    {
      alert('clicked'); //$("#modId").attr ( "checked" , true );
    }
    else
    {
     alert('no');
    }
   });
});

 function valid(){
          var grant = $('#grantname').val();
          var len = grant.length;

		if(grant == "") {
        		alert("Would you please enter grant name?")
 			return false;
		}

                if(len <4) {
        		alert("Grant name should be minimum four characters")
 			return false;
		} 
                if(len >16) {
        		alert("Grant name too long maximum sixteen characters")
 			return false;
		}
		return true;
        }