

function getXMLHTTP() {
    var xmlhttp=false;
    try {
            xmlhttp=new XMLHttpRequest();
    }
    catch(e) {
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

function getAreaDetails(path,villageID) 
{
    var strURL=path+"/familydefault/index/getcities?villageID="+villageID;
    if(villageID != '') {
        var req = getXMLHTTP();
        req.onreadystatechange = function() {
            if (req.readyState == 4) {
                if (req.status == 200) {
                    var aa=req.responseText;
                        String.prototype.trim = function() {
                            return this.replace(/^\s+/,'').replace(/\s+$/,'');
                        }

                        var splitstring=aa.trim();
                        var city = splitstring.split("@");
                        if(city[0]) {
                            document.getElementById('city').value = city[0];
                        } else {
                            document.getElementById('city').value = '';
                        }
                        if(city[1]) {
                        document.getElementById('district').value = city[1];
                        } else {
                            document.getElementById('district').value = '';
                        }
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