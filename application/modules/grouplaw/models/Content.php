<?php class Grouplaw_Model_Content {

public function getstring($id,$code)
{

$groupmodel= new Grouplaw_Model_grouplaw ();
$groupdetails= $groupmodel->groupDeatils($code);
$day = $groupdetails[0]['dayname'];
$law = array("1The vision of Ourbank is to stimulate local development by offering small and medium sized micro financial institutions (MFIs) a true free and open source $day software solution, based on community driven software development, named OurBank",

"2The vision of Ourbank is to stimulate local development by offering small and medium sized micro financial institutions (MFIs) a true free and open source software solution, based on community driven software development, named OurBank",

"3The vision of Ourbank is to stimulate local development by offering small and medium sized micro financial institutions (MFIs) a true free and open source software solution, based on community driven software development, named OurBank",

"4The vision of Ourbank is to stimulate local development by offering small and medium sized micro financial institutions (MFIs) a true free and open source software solution, based on community driven software development, named OurBank",

"5The vision of Ourbank is to stimulate local development by offering small and medium sized micro financial institutions (MFIs) a true free and open source software solution, based on community driven software development, named OurBank",

"6The vision of Ourbank is to stimulate local development by offering small and medium sized micro financial institutions (MFIs) a true free and open source software solution, based on community driven software development, named OurBank",

"7The vision of Ourbank is to stimulate local development by offering small and medium sized micro financial institutions (MFIs) a true free and open source software solution, based on community driven software development, named OurBank",

"8The vision of Ourbank is to stimulate local development by offering small and medium sized micro financial institutions (MFIs) a true free and open source software solution, based on community driven software development, named OurBank",

"9The vision of Ourbank is to stimulate local development by offering small and medium sized micro financial institutions (MFIs) a true free and open source software solution, based on community driven software development, named OurBank");

for($i=0;$i<=10;$i++){
    if($i == $id)
        {
            return $law[$i];
        }

    }
}

}