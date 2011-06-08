
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

function getXMLHTTP() { //fuction to return the xml http object
    var xmlhttp=false;	
        try {
            xmlhttp=new XMLHttpRequest();
        }
        catch(e) {	
            try {
              xmlhttp= new ActiveXObject("Microsoft.XMLHTTP");
            }
       catch(e){
            try{
             xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
            }
       catch(e1) {
            xmlhttp=false;
            }
        }
    }
        return xmlhttp;
    }

    function getBranch(office_id,path) {		
    var strURL = path +"/membership/individual/getbranch?office_id="+office_id;

    var req = getXMLHTTP();
    if (req) {
        req.onreadystatechange = function() {
        if (req.readyState == 4) {   // only if "OK"
        if (req.status == 200) {	
            document.getElementById('statediv').innerHTML=req.responseText;						
        } else {
               alert("There was a problem while using XMLHTTP:\n" + req.statusText);
            }
        }
            }	
        req.open("GET", strURL, true);
        req.send(null);
        }
	}



    $(function() {
    $('.error').hide();
    $('.error1').hide();
    $('.error2').hide()
    $('input.textfield').css({backgroundColor:"#FFFFFF"});
    $('input.textfield').blur(function(){
    $(this).css({backgroundColor:"#FFFFFF"});
    });
    $('input.textfield').blur(function(){
    $(this).css({border:"1px solid #686A6F"});
    });
    });

    $(function() {
    $(".officesubmit").click(function() {
    var name1 = $("select#officeType").val();
        if (name1 == "") {
        $("label#name_error2").show();
        $("select#officeType").css({backgroundColor:"#FFFFD5"});
        $("select#officeType").css({border:"2px solid red"});
        }

    var name2 = $("select#subOffice").val();
    if (name2 == "") {
    $("label#name_error1").show();
    $("select#subOffice").css({backgroundColor:"#FFFFD5"});
    $("select#subOffice").css({border:"2px solid red"});
    }

    var name3 = $("input#membertitle").val();
    if (name3 == "") {
    $("label#name_error").show();
    $("input#membertitle").css({backgroundColor:"#FFFFD5"});
    $("input#membertitle").css({border:"2px solid red"});
    }

    var name4 = $("input#memberaddressline1").val();
    if (name4 == "") {
    $("label#name_error").show();
    $("input#memberaddressline1").css({backgroundColor:"#FFFFD5"});
    $("input#memberaddressline1").css({border:"2px solid red"});
    }

    var name5 = $("input#memberpincode").val();
    if (name5 == "") {
    $("label#name_error").show();
    $("input#memberpincode").css({backgroundColor:"#FFFFD5"});
    $("input#memberpincode").css({border:"2px solid red"});
    }

    var name6 = $("input#officeState").val();
    if (name6 == "") {
    $("label#name_error").show();
    $("input#officeState").css({backgroundColor:"#FFFFD5"});
    $("input#officeState").css({border:"2px solid red"});
    }

    var name7 = $("input#officeCountry").val();
    if (name7 == "") {
    $("label#name_error").show();
    $("input#officeCountry").css({backgroundColor:"#FFFFD5"});
    $("input#officeCountry").css({border:"2px solid red"});
    }

    var name8 = $("input#officePincode").val();
    if (name8 == "") {
    $("label#name_error").show();
    $("input#officePincode").css({backgroundColor:"#FFFFD5"});
    $("input#officePincode").css({border:"2px solid red"});
    }

    var name9 = $("input#officeCity").val();
    if (name9 == "") {
    $("label#name_error").show();
    $("input#officeCity").css({backgroundColor:"#FFFFD5"});
    $("input#officeCity").css({border:"2px solid red"});
    }

    var name10 = $("input#officePhone").val();
    if (name10 == "") {
    $("label#name_error").show();
    $("input#officePhone").css({backgroundColor:"#FFFFD5"});
    $("input#officePhone").css({border:"2px solid red"});
    }

    var name11 = $("select#gender_id").val();
    if (name11 == "") {
    $("label#name_error1").show();
    $("select#gender_id").css({backgroundColor:"#FFFFD5"});
    $("select#gender_id").css({border:"2px solid red"});
    } 

    var name12 = $("select#physicalstatus_id").val();
    if (name12 == "") {
    $("label#name_error1").show();
    $("select#physicalstatus_id").css({backgroundColor:"#FFFFD5"});
    $("select#physicalstatus_id").css({border:"2px solid red"});
    }

    var name13 = $("input#membercity").val();
    if (name13 == "") {
    $("label#name_error").show();
    $("input#membercity").css({backgroundColor:"#FFFFD5"});
    $("input#membercity").css({border:"2px solid red"});
    }
    var name14 = $("input#source1").val();
    if (name14 == "") {
    $("label#name_error").show();
    $("input#source1").css({backgroundColor:"#FFFFD5"});
    $("input#source1").css({border:"2px solid red"});
    }


    var name15 = $("input#memberdateofbirth").val();
    if (name15 == "") {
    $("label#name_error").show();
    $("input#memberdateofbirth").css({backgroundColor:"#FFFFD5"});
    $("input#memberdateofbirth").css({border:"2px solid red"});
    } 

    var name180 = $("select#membermaritalstatus_id").val();
    if (name180 == "") {
    $("label#name_error").show();
    $("select#membermaritalstatus_id").css({backgroundColor:"#FFFFD5"});
    $("select#membermaritalstatus_id").css({border:"2px solid red"});
    }

    if(name1 =="" || name2 =="" || name3 =="" || name4 =="" || name5 =="" || name6 =="" || name7 =="" || 
       name8 =="" || name9 =="" || name10 =="" || name11 =="" || name12 == "" || name13 == "" || name14== "" || name15 == "" || name180 == "") {
   
        return false;
    } 
	$('#container-1').enableTab(2);
    }

);


});
    $(function() {
    $(".officesubmit1").click(function() {


    var name14 = $("select#memberstatus_id").val();
    if (name14 == "") {
    $("label#name_error1").show();
    $("select#memberstatus_id").css({backgroundColor:"#FFFFD5"});
    }

    var name15 = $("select#otherassets").val();
    if (name15 == "") {
    $("label#name_error1").show();
    $("select#otherassets").css({backgroundColor:"#FFFFD5"});
    }




    if( name14 =="" || name15 =="") {
        alert('* marked  are mandatory');
        return false;
    }
    });
});


    $(function() {
    $(".officesubmit2").click(function() {


    var name16 = $("input#memberName1").val();
    if (name16 == "") {
    $("label#name_error").show();
    $("input#memberName1").css({backgroundColor:"#FFFFD5"});
    $("input#memberName1").css({border:"2px solid red"});
    }

    var name17 = $("input#memberName2").val();
    if (name17 == "") {
    $("label#name_error").show();
    $("input#memberName2").css({backgroundColor:"#FFFFD5"});
    $("input#memberName2").css({border:"2px solid red"});
    }

    if( name16 ==""|| name17 =="") {
        //alert('* marked  are mandatory');
        return false;
    }
    $('#container-1').enableTab(4);
    $('#container-1').enableTab(5);
    $('#container-1').enableTab(6);
    
    }); 
});