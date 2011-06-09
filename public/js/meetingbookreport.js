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


    function getMeeting(meeting_ID,path,a) {	
        var strURL=path+"/meetingbookreport/index/fetchmeeting?meeting_ID="+meeting_ID; /*alert(strURL);*/
        if(meeting_ID!=''){
        var req = getXMLHTTP();
        
                req.onreadystatechange = function() {
                        if (req.readyState == 4) {
                                // only if "OK"
                                if (req.status == 200) {
                                        document.getElementById('meetingnodiv').innerHTML=req.responseText;
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


