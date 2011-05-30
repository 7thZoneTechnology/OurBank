<?php
class Phone_Model_Phone extends Zend_Db_Table 
{
    protected $_name = 'ourbank_accounts';
    public function addPhone($post) 
    {
        //insertion of family
        $db = Zend_Db_Table::getDefaultAdapter();
        $family = array('select1_0' => $post["select1_0"],
                        'textfield1_0' => $post["textfield1_0"],
                        'textfield1_1' => $post["textfield1_1"],
                        'select1_1' => $post["select1_1"],
                        'select1_2' => $post["select1_2"],
                        'RadioGroup1_0'=> $post["RadioGroup1_0"],
                        'select1_3'=>$post["select1_3"],
                        'RadioGroup1_3' => $post["RadioGroup1_3"],
                        'RadioGroup1_4' => $post["RadioGroup1_4"],
                        'RadioGroup1_5' => $post["RadioGroup1_5"],
                        'select1_4' => $post["select1_4"]);
        $db->insert("phone_family",$family);
        $familyID = $db->lastInsertId('id');
        //insertion of family member
        $familyMem = array('family_id' => $familyID,
                            'select2_1_1' => $post["select2_1_1"],
                            'select2_1_2' => $post["select2_1_2"],
                            'select2_1_3' => $post["select2_1_3"],
                            'select2_1_4' => $post["select2_1_4"],
                            'select2_1_5' => $post["select2_1_5"],
                            'select2_1_6'=> $post["select2_1_6"],
                            'select2_1_7' => $post["select2_1_7"],
                            'select2_1_8'=>$post["select2_1_8"],
                            'select2_1_9' => $post["select2_1_9"],
                            'select2_1_10' => $post["select2_1_10"],
                            'select2_1_11' => $post["select2_1_11"],
                            'select2_1_12' => $post["select2_1_12"],
                            'select2_1_13' => $post["select2_1_13"],
                            'select2_1_14' => $post["select2_1_14"],
                            'textfield2_1_1' => $post["textfield2_1_1"],
                            'textfield2_1_2' => $post["textfield2_1_2"]
                            );
        $db->insert("phone_family_member",$familyMem);
        return ;
    }
}