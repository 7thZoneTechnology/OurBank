
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
        var strURL=path+"/attendance/index/fetchmembers?meeting_ID="+meeting_ID;
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
        var strURL=path+"/attendance/index/fetchmeeting?meeting_ID="+meeting_ID;
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
        var strURL=path+"/attendance/index/fetchmembersedit?meeting_ID="+meeting_ID+"&attendance_id="+attendance_id;
    
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

