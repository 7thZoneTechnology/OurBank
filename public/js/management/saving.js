
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
function getXMLHTTP() { //fuction to return the xml http object
		var xmlhttp=false;	
		try{
			xmlhttp=new XMLHttpRequest();
		}
		catch(e)	{		
			try{			
				xmlhttp= new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch(e){
				try{
				xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
				}
				catch(e1){
					xmlhttp=false;
				}
			}
		}
		return xmlhttp;
    }

 var current =0;
    function membername() {
    var count = document.myform.memberCount.value;
    for (var i = 1; i<=count; i++) {
        var name = $("input#memberName"+i).val();
    }
    }


function addFormField(baseUrl) {
	current++;
	var id = document.getElementById("id").value;
	$("#interestperiods").append("<p id='row" + id + "'><br/><label for='memberName" + id + "'><input type='text' size='3' name='memberName"+current+"' id='memberName" + id + "' class = 'txt_put'><label for='To" + id + "'>&nbsp;<input type='text' size='3' name='To"+current+"' id='To" + id + "' class = 'txt_put'>&nbsp;&nbsp;&nbsp;<label for='Rate" + id + "'>&nbsp;<input type='text' size='3' name='Rate"+current+"' id='Rate" + id + "' class = 'txt_put'>&nbsp;&nbsp;&nbsp;&nbsp;<a href='#' onClick='removeFormField(\"#row" + id + "\"); return false;'><img src='"+baseUrl+"/images/delete.gif'  border=0 width='16' height='16'></a></td>&nbsp;&nbsp;</tr>");
	document.myform.memberCount.value = id;	
	id =( id - 1) + 2;
	document.getElementById("id").value = id;
}

function removeFormField(id) {
	$(id).remove();
}

