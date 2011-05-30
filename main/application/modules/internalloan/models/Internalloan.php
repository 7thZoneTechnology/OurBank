<?php
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
class Internalloan_Model_Internalloan extends Zend_Db_Table 
{
    protected $_name = 'ourbank_declaration';
    public function groupDeatils($code)
    {
        $db = Zend_Db_Table::getDefaultAdapter();
        $db->setFetchMode(Zend_Db::FETCH_OBJ);
        $sql = "SELECT
                count(A.id) as groupNum,
                A.id,
                A.name,
                A.familycode,
                C.name as groupname,
                C.groupcode as groupcode,
                D.name as officename
                FROM
                ourbank_familymember A,
		ourbank_groupmembers B,
		ourbank_group C,
		ourbank_office D
                WHERE
                C.groupcode = $code AND
               	C.id = B.group_id AND
		B.member_id  = A.id AND
		C.village_id = D.id
                ";
        $result = $db->fetchAll($sql);
        return $result;
    }
}


