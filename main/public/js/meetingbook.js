function getXMLHTTP() {
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

function getMembers1(meeting_ID,path,a) {	
        var strURL=path+"/meetingbook/index/fetchmembers?meeting_ID="+meeting_ID;
        if(meeting_ID!=''){
        var req = getXMLHTTP();
        
                req.onreadystatechange = function() {
                        if (req.readyState == 4) {
                                // only if "OK"
                                if (req.status == 200) {
                                        document.getElementById('statediv').innerHTML=req.responseText;
                                }
                                    else {
                                        alert("There was a problem while using XMLHTTP:\n" + req.statusText);
                                }
                        }				
                }			
                req.open("GET", strURL, true);
                req.send(null);
        }
    }

    function getMeeting(meeting_ID,path,a) {	
        var strURL=path+"/meetingbook/index/fetchmeeting?meeting_ID="+meeting_ID;
        if(meeting_ID!=''){
        var req = getXMLHTTP();
        
                req.onreadystatechange = function() {
                        if (req.readyState == 4) {
                                // only if "OK"
                                if (req.status == 200) {
                                        document.getElementById('statediv1').innerHTML=req.responseText;
                                }
                                    else {
                                        alert("There was a problem while using XMLHTTP:\n" + req.statusText);
                                }
                        }				
                }			
                req.open("GET", strURL, true);
                req.send(null);
        }
    }


    function getMembers(meeting_ID,path,attendance_id) {	
        var strURL=path+"/meetingbook/index/fetchmembersedit?meeting_ID="+meeting_ID+"&attendance_id="+attendance_id;
    
        if(meeting_ID!=''){
        var req = getXMLHTTP();
        
            req.onreadystatechange = function() {
                    if (req.readyState == 4) {
                            // only if "OK"
                            if (req.status == 200) {
                                    document.getElementById('statediv').innerHTML=req.responseText;
                            }
                                else {
                                    alert("There was a problem while using XMLHTTP:\n" + req.statusText);
                            }
                    }				
            }			
            req.open("GET", strURL, true);
            req.send(null);
        }
    }

function calculateSum() { 
	    var sum=0;
	    //iterate through each textboxes and add the values
	    $(".loandue").each(function() {  
            if(!isNaN(this.value) && this.value.length!=0) {
	    sum += parseFloat(this.value); 
           }
	   });
	   $(".dueamount").val(sum); 
}

function calsavings() { 
	    var sum=0;
	    //iterate through each textboxes and add the values
	    $(".savingspaid").each(function() {  
            if(!isNaN(this.value) && this.value.length!=0) {
	    sum += parseFloat(this.value); 
           }
	   });
	   $(".saveamount").val(sum); 
}

function calculatetotalpaid(id) { 
	        var sum=0,totalindividual=0; 
                var fee=$(".fee"+id).val();
                var amount=$('#amount'+id).val(); 
                var loandue=$('#loandue'+id).val(); 
                totalindividual=Number(amount)+Number(loandue)+Number(fee);
                //overalltot(totalindividual);
	        var overalltotal= $("#totalpaid"+id).val(totalindividual.toFixed(2));
                caltotalfee(id);
                overalltot();
}

function caltotalfee(id) {
		var sum = 0;
		$(".totfee").each(function() { 
			if(!isNaN(this.value) && this.value.length!=0) {
				sum += parseFloat(this.value); //alert(sum);
			}
		});
		$("#totalfee").val(sum.toFixed(2));
}

function overalltot(id) { 
		var sum = 0;
		$(".totalpaid").each(function() {
			if(!isNaN(this.value) && this.value.length!=0) {
				sum += parseFloat(this.value); //alert(sum);
			}
		});
		$(".overallpaid").val(sum.toFixed(2));
}

//savings paid amount addition with absent
function absent(absent,id) {
$(".fee"+id).val(absent.toFixed(2));
    calculatetotalpaid(id);
}
//savings paid amount addition with late
function late(late,id) { 
$(".fee"+id).val(late.toFixed(2));
    calculatetotalpaid(id);
}

