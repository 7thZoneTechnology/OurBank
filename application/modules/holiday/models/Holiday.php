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
?>

<?php
class Holiday_Model_Holiday extends Zend_Db_Table {
	protected $_name = 'ourbank_holiday';
//getting holiday details
	public function getHolidayDetails() {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_holiday'),array('a.id','a.name','DATE(a.holiday_from)=".date("d-m-y")."'))
									->join(array('b'=>'ourbank_officehierarchy'),'a.office_id = b.id',array('b.type as officename') );
 	//	die($select->__toString($select));
// 
		$result = $this->fetchAll($select);
		return $result->toArray();
	}
//getting office
public function getOffice() {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_officehierarchy'),array('id'));
		$result = $this->fetchAll($select);
		return $result->toArray();
//die($select->__toString($select));
	}

//getting holiday
	public function getHoliday($id) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_holiday'),array('id'))
			->where('a.id = ?',$id)
			->join(array('b'=>'ourbank_officehierarchy'),'a.office_id = b.id',array('b.type as officename'));

		$result = $this->fetchAll($select);
		return $result->toArray();
	}



	

	public function getCategory($id) {
		$select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_category'),array('id'))
                ->where('id=?',$id);
		// die($select->__toString($select));
        $result=$this->fetchAll($select);
        return $result->toArray();
	}

	

	public function SearchHoliday($post = array()) {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_holiday'),array('id'))
			->where('a.office_id like "%" ? "%"',$post['office_id'])
			->where('a.name like "%" ? "%"',$post['name'])
			->where('a.holiday_from like "%" ? "%"',$post['holiday_from'])
			->where('a.holiday_upto like "%" ? "%"',$post['holiday_upto'])
									->join(array('b'=>'ourbank_officehierarchy'),'a.office_id = b.id',array('b.type as officename') );

		$result = $this->fetchAll($select);
		return $result->toArray();
	}

	
}
])
									->join(array('b'=>'ourbank_officehierarchy'),'a.office_id = b.id',array('b.type as officename') );
 		//die($select->__toString($select));

		$result = $this->fetchAll($select);
		return $result->toArray();
		} else {
		$select = $this->select()
			->setIntegrityCheck(false)  
			->join(array('a' => 'ourbank_holiday'),array('a.id','a.name','DATE(a.holiday_from)=".date("d-m-y")."'))
									->join(array('b'=>'ourbank_officehierarchy'),'a.office_id = b.id',array('b.type as officename') );
 	//	die($select->__toString($select));
// 
		$result = $this->fetchAll($select);
		return $result->toArray();
		}
	}















	
}
