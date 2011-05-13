<?php
$id=$_GET['selectedCategory'];


        $select=$this->select()
                ->setIntegrityCheck(false)
                ->join(array('a'=>'ourbank_category'),array('id'));

        $result=$this->fetchAll($select);

echo "<select>
";

while($row = mysql_fetch_array($result))
  {
  
  echo "<option>" . $row['name'] . "</option>";
 
  }
echo "</select>";


?> 