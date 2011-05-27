  $.validator.addMethod("noSpecialChars", function(value, element) {
   
    
      return this.optional(element) || /^[\w,-/]+$/i.test(value);
  }, "Username must contain only letters, numbers, or underscore.");
 
    $.validator.addMethod('required_group', function(value, element, param ) {
        objgroup=$('.'+param);
        flag=false;
         $.each(objgroup, function(){
                if($(this).val())
                     {flag=true;
                     
                      }
              
                });
                
         return flag
        }, "Fill either acre or kunta");
