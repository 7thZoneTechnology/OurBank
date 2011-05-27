<?php
class Loans_Model_Loan extends Zend_Db_Table {
    protected $_name = 'ourbank_product';

    public function getLoan() 
    {
        $select = $this->select()
                    ->setIntegrityCheck(false)
                    ->join(array('a' => 'ourbank_productsoffer'),array('id'),array('a.id as offerid','a.name as productname','a.shortname as shortname1'))
                    ->join(array('b'=>'ourbank_productsloan'),'a.id = b.productsoffer_id')
                    ->join(array('c'=>'ourbank_product'),'a.product_id = c.id')
                    ->where('c.category_id=2')
                    ->order('a.id DESC');

        $result = $this->fetchAll($select);
        return $result->toArray();
    }
 public function getAllGlcode(){
            $this->db = $this->getAdapter();
            $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
            $sql = 'select header from ourbank_glcode';
            $result = $this->db->fetchALL($sql,array());
            return $result;
        }

  public function generateGlCode($ledgertype_id)
            {
                $this->db = $this->getAdapter();
                $this->db->setFetchMode(Zend_Db::FETCH_OBJ);
                $result = $this->db->fetchRow("SELECT MAX(id) as id 
                                                FROM  ourbank_glcode 
                                                where (ledgertype_id = '$ledgertype_id')");
        
                return $result;
            }
    public function insertGlcode($input)
            {
                $this->db = $this->getAdapter();
                $this->db->insert('ourbank_glcode',$input);
                return '1';
            } 

 public function getGlCode($header){
                $db = $this->getAdapter();
                        $sql = "select max(glsubcode) as glsubcode from ourbank_glsubcode where glcode_id =(select id from ourbank_glcode where header like '%".$header."%')";
                $result = $db->fetchOne($sql);
	       return $result; // //return liabilities values 
        } 


        public function getGlCodeid($header){
                $db = $this->getAdapter();
                        $sql = "select id from ourbank_glcode where header like '%".$header."%'";
                $result = $db->fetchOne($sql);
	       return $result; // //return liabilities values 
        } 

        public function getGlCodeexist($header){
                $db = $this->getAdapter();
                        $sql = "select glcode from ourbank_glcode where header like '%".$header."%'";
                $result = $db->fetchOne($sql);
	       return $result; // //return liabilities values 
        }

        public function fetchAllglsubcode($id)
        {
            $select = $this->select()
                        ->setIntegrityCheck(false)  
                        ->join(array('a' => 'ourbank_glsubcode'),array('id'))
                        ->where('a.subledger_id = '.$id);
            $result = $this->fetchAll($select);
            return $result->toArray();
        }








        public function fetchProductloan($table,$param)
        {
            $select = $this->select()
                        ->setIntegrityCheck(false)  
                        ->join(array('a' => $table),array('offerproduct_id'))
                        ->where('a.offerproduct_id = ?',$param);
            $result = $this->fetchAll($select);
            return $result->toArray();
        }

        public function fetchProductloan1($table,$param)
        {
            $select = $this->select()
                        ->setIntegrityCheck(false)  
                        ->join(array('a' => $table),array('productsoffer_id'))
                        ->where('a.productsoffer_id = ?',$param);
            $result = $this->fetchAll($select);
            return $result->toArray();
        }

        public function searchLoan($post = array()) 
        {
            $select = $this->select()
                        ->setIntegrityCheck(false)
                        ->join(array('a' => 'ourbank_productsoffer'),array('id'),array('a.name as productname','a.shortname as shortname1','a.id as offerid'))
                        ->where('a.name like "%" ? "%"',$post['field6'])
                        ->where('a.shortname like "%" ? "%"',$post['field2'])
                        ->join(array('b' => 'ourbank_productsloan'),'a.id=b.productsoffer_id')
                        ->where('b.minimumfrequency like "%" ? "%"',$post['field3'])
                        ->where('b.maximunloanamount like "%" ? "%"',$post['field4'])
                        ->order('a.id desc');
            $result = $this->fetchAll($select);
            return $result->toArray();
        }

        public function getloantype() 
        {
            $result = $this->fetchAll();
            return $result;
        }

        public function getSaving() 
        {
            $select = $this->select()
                        ->setIntegrityCheck(false)  
                        ->join(array('a' => 'ourbank_productsoffer'),array('offerproduct_id'))
                        ->where('a.category_id = 1');
            $result = $this->fetchAll($select);
            return $result->toArray();
        }

        public function getofferproductid($offerproduct_id)
        {
            $select = $this->select()
                        ->setIntegrityCheck(false)  
                        ->join(array('a' => 'ourbank_productsoffer'),array('id'))
                        ->where('a.id = ?',$offerproduct_id);
            $result = $this->fetchAll($select);
            return $result->toArray();
        }


        public function fetchAllglsubcodeforincome()
        {
            $select = $this->select()
                        ->setIntegrityCheck(false)  
                        ->join(array('a' => 'ourbank_glsubcode'),array('id'))
                        ->where('a.subledger_id = 1');
            $result = $this->fetchAll($select);
            return $result->toArray();
        }

        public function viewLoanmy($offerproduct_id) 
        {

            $select = $this->select()
                        ->setIntegrityCheck(false)  
                        ->join(array('a' => 'ourbank_productsoffer'),array('id'),array('id','a.name as productname','a.shortname as productshortname','a.description as productdescription','begindate','closedate','applicableto','fee_glsubcode_id','Interest_glsubcode_id','glsubcode_id'))
                        ->where('a.id = ?',$offerproduct_id)
                        ->join(array('b' => 'ourbank_productsloan'),'a.id = b.productsoffer_id') 
                        ->join(array('c' => 'ourbank_master_ledgertypes'),'c.id = a.applicableto')
                        ->join(array('h' => 'ourbank_glsubcode'),'a.glsubcode_id = h.id')
                        ->join(array('j' => 'ourbank_master_interesttypes'),'b.interesttype_id = j.id')
                        ->join(array('f' => 'ourbank_product'),'f.id = a.product_id',array('f.id as productid','f.name as productname1'));
            $result = $this->fetchAll($select);
            return $result->toArray();
        }

        public function viewLoan3($offerproduct_id) 
        {
            $select = $this->select()
                        ->setIntegrityCheck(false)  
                        ->join(array('a' => 'ourbank_productsoffer'),array('id'))
                        ->where('a.id = ?',$offerproduct_id)
                        ->join(array('b' => 'ourbank_interest_periods'),'a.id = b.offerproduct_id');
        //         die($select->__toString());
            $result = $this->fetchAll($select);
            return $result->toArray();
        }

        public function addProductDetails($post) 
        {
            $this->view->dateconvert = new App_Model_dateConvertor();
            $this->db = Zend_Db_Table::getDefaultAdapter();
            $data = array('id'=>'',
                            'name'=>$post['offerproductname'],
                            'shortname'=>$post['offerproductshortname'],
                            'product_id'=>$post['product_id'],
                            'description'=>$post['offerproduct_description'],
                            'begindate'=>$this->view->dateconvert->phpmysqlformat($post['begindate']),
                            'closedate'=>$this->view->dateconvert->phpmysqlformat($post['closedate']),
                            'applicableto'=>$post['applicableto'],
//                             'glsubcode_id'=>$post['glsubcode_id'],
                            'capital_glsubcode_id' => '');
//                             'Interest_glsubcode_id'=>$post['interest_glsubcode_id'],
//                             'fee_glsubcode_id'=>$post['fee_glsubcode_id']);
            $this->db->insert('ourbank_productsoffer',$data);
        }

        public function editOffer($table,$post,$id) 
        {
            $this->view->dateconvert = new App_Model_dateConvertor();
            $this->db = Zend_Db_Table::getDefaultAdapter();
            $where='id = '.$id;
            $data = array(  'name'=>$post['offerproductname'],
                            'shortname'=>$post['offerproductshortname'],
                            'product_id'=>$post['product_id'],
                            'description'=>$post['offerproduct_description'],
                            'begindate'=>$this->view->dateconvert->phpmysqlformat($post['begindate']),
                            'closedate'=>$this->view->dateconvert->phpmysqlformat($post['closedate']),
                            'applicableto'=>$post['applicableto'],
                            'glsubcode_id'=>$post['glsubcode_id'],
                            'capital_glsubcode_id' => '',
                            'Interest_glsubcode_id'=>$post['interest_glsubcode_id'],
                            'fee_glsubcode_id'=>$post['fee_glsubcode_id']);
            $this->db->update($table,$data,$where);
        }

        public function insertRow5($table,$input = array()) 
        {
            $this->db = Zend_Db_Table::getDefaultAdapter();
            $this->db->insert($table,$input);
            return '1';
        }

        public function viewproduct($product_id) 
        {
            $select = $this->select()
                        ->setIntegrityCheck(false)
                        ->join(array('a' => 'ourbank_product'),array('id'))
                                ->where('a.id = ?',$product_id);
            $result = $this->fetchAll($select);
            return $result->toArray();
        }

        public function viewappliesto($applicableto) 
        {
                $select = $this->select()
                        ->setIntegrityCheck(false)
                        ->join(array('a' => 'ourbank_master_ledgertypes'),array('id'))
                                ->where('a.id = ?',$applicableto);
        $result = $this->fetchAll($select);
        return $result->toArray();
        }

        public function deleteRecord($table,$param1,$param2)
        {
                $db = $this->getAdapter();
                $db->delete($table,array(''.$param1.' = '.$param2));
                return;
        }

}