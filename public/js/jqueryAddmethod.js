  $.validator.addMethod("noSpecialChars", function(value, element) {
   
    
      return this.optional(element) || /^[\w,-/]+$/i.test(value);
  }, "Must contain only letters, numbers, or underscore.");
 
$.validator.addMethod("EitherOr", function(value, element) {
   
      curreobj=$('#'+this.idOrName(element));
     
         nextObj=curreobj.parent().next();
         if( curreobj.val() || nextObj.val()){
          return   true;
         } 
      return   false;
  }, "Fill either acre or gunta" );

//for multi rows

$.validator.prototype.elements= function() {
var validator = this,
    rulesCache = {};

// select all valid inputs inside the form (no submit or reset buttons)
// workaround $Query([]).add until http://dev.jquery.com/ticket/2114 is solved
return $([]).add(this.currentForm.elements)
.filter(":input")
.not(":submit, :reset, :image, [disabled]")
.not( this.settings.ignore )
.filter(function() {
    !this.name && validator.settings.debug && window.console && console.error( "%o has no name assigned", this);

    // select only the first element for each name (EXCEPT elements that end in []), and only those with rules specified
    if ( (!this.name.match(/\[\]/gi) && this.name in rulesCache) || !validator.objectLength($(this).rules()) )
        return false;

    rulesCache[this.name] = true;
    return true;
});
};


$.validator.prototype.idOrName = function(element) {

// Special edit to get fields that end with [], since there are several [] we want to disambiguate them
// Make an id on the fly if the element doesnt have one
if(element.name.match(/\[\]/gi)) {
    if(element.id){
        return element.id;
    } else {
        var unique_id = new Date().getTime();

        element.id = new Date().getTime();

        return element.id;
    }
}

return this.groups[element.name] || (this.checkable(element) ? element.name : element.id || element.name);
};

