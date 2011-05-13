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
class Grouplaw_Model_grouplaw extends Zend_Db_Table 
{
    protected $_name = 'ourbank_declaration';

    public function groupDeatils($groupcode)
    {
        $select=$this->select()
            ->setIntegrityCheck(false)
            ->join(array('a'=>'ourbank_group'),array('a.id'))
            ->where('a.groupcode=?',$groupcode)
            ->join(array('b'=>'ourbank_groupmembers'),'b.group_id =a.id')
             ->join(array('c'=>'ourbank_familymember'),'c.id =b.member_id',array('c.id'))
            ->join(array('d'=>'ourbank_master_weekdays'),'d.id =a.days',array('d.name as dayname'));
        //die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
    }

    public function getgroupmembers($groupcode)
    {
            $select= $this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_group'),array('a.id'),array('a.id'))
                ->where('a.groupcode=?',$groupcode)
                ->join(array('b'=>'ourbank_groupmembers'),'b.group_id=a.id')
                ->join(array('c'=>'ourbank_familymember'),'b.member_id=c.id',array('c.name as membername','c.family_id','c.uid'));
            $result=$this->fetchAll($select);
            return $result->toArray();
    }

    public function getfathername($familyid)
    {
        $select= $this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_familymember'),array('a.id'),array('a.name as fathername'))
                ->where('a.family_id=?',$familyid)
                ->join(array('b'=>'ourbank_master_realtionshiptype'),'b.id=a.relationship_id')
                ->where('b.name=?','Father');
        //die($select->__toString($select));
            $result=$this->fetchAll($select);
            return $result->toArray();
    }

    public function wordrap($text)
    {
        $newtext = wordwrap($text, 130, "<br />\n");
        $pieces = explode("<br />", $newtext);
        return $pieces;
    }
}


