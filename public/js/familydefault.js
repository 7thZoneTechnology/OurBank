
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


    function gethabitationDetails(path,rev_villageid) {
    if(rev_villageid) { 
            targeturl=path+"/familydefault/index/gethabitation?rev_village="+rev_villageid;
            $.ajax({ url: targeturl, success: function(data){ $("#village").html(data) }});
    }
    }

    function getrevvillage(path,kootaid) { 
        if(kootaid) { 
                targeturl=path+"/familydefault/index/revname?koota_id="+kootaid;
                $.ajax({ url: targeturl, success: function(data){ $("#revdiv").html(data) }});
        }
    }

    function gettaluk(path,rev_villageid) {
        if(rev_villageid) { 
                targeturl=path+"/familydefault/index/talukname?rev_village="+rev_villageid;
                $.ajax({ url: targeturl, success: function(data){ $("#talukdiv").html(data) }});
        }
    }

    function getpincode(path,rev_villageid,modid) {
        if(rev_villageid) { 
                targeturl=path+"/familydefault/index/pincode?rev_village="+rev_villageid+"&mod_id="+modid;
                $.ajax({ url: targeturl, success: function(data){ $("#pincodediv").html(data) }});
        }
    }

    $(function(){
    $(".child").click ( function() {
        var count=$("#count").val();
        if($("#health-1").is(':checked')) {
            for( i=2; i <= count; i++){
                $("#health-"+i).attr ( "disabled" , true );
            }
        } else {
            for( i=2; i <= count; i++){
                $("#health-"+i).attr ( "disabled" , false );
            }
        }
    });
    });
