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
 

function getXMLHTTP() 
{
    var xmlhttp=false;	
    try{
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

function getGroups(officeID,path)
{	
    var strURL=path+"/meeting/index/fetchgroups?officeID="+officeID;
    if(officeID!='') {
    var req = getXMLHTTP();
    
        req.onreadystatechange = function() {
            if (req.readyState == 4) {
                if (req.status == 200) {
                    document.getElementById('groupDiv').innerHTML=req.responseText;
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

function fetchoffice(officeID,path)
{	
    var strURL=path+"/officemeeting/index/fetchoffice?officeID="+officeID; 
    if(officeID!='') {
    var req = getXMLHTTP();
    
        req.onreadystatechange = function() {
            if (req.readyState == 4) { 
                if (req.status == 200) { 
                    document.getElementById('groupDiv').innerHTML=req.responseText;
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

function getHeadName(group_id,path) 
{	
    var strURL=path+"/meeting/index/headname?group_id="+group_id;
    if(group_id!='') {
    var req = getXMLHTTP();
    
    req.onreadystatechange = function() {
        if (req.readyState == 4) { 
            if (req.status == 200) { 
                    document.getElementById('grouphead').innerHTML=req.responseText; 
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

// function getGroups(bank_id,path) {	
// 	var strURL=path+"/meeting/index/fetchgroups?bank_id="+bank_id;
// 	if(bank_id!='') {
// 	var req = getXMLHTTP();
// 	
// 		req.onreadystatechange = function() {
// 			if (req.readyState == 4) {
// 				// only if "OK"
// 				if (req.status == 200) {
// 					document.getElementById('groupDiv').innerHTML=req.responseText;
// 				}
// 					else {
// 					alert("There was a problem while using XMLHTTP:\n" + req.statusText);
// 				}
// 			}				
// 		}			
// 		req.open("GET", strURL, true);
// 		req.send(null);
// 	}
// }

