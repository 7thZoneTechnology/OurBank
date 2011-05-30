<?php

class DH_ClassInfo
{
    private $dir;

    public function __construct($dirPath)
    {
        if(is_dir($dirPath))
            $this->dir = $dirPath;
        else
            throw new Exception($dirPath . " is not Directory or its not Readable.");
    }
	
    public function getControllerClassFiles()
    {
		$files = scandir($this->dir);
		return array_filter($files, "filterClassFile");
    }
	
    public function getControllerClassNames()
    {
        $files = $this->getControllerClassFiles();
        $names = array();
        $classNames = array();
        foreach($files as $file) {
            $data = file($this->dir.DIRECTORY_SEPARATOR.$file, FILE_IGNORE_NEW_LINES);
            foreach(array_filter($data, "filterClassName") as $key) {
                array_push($names, $key);
            }
        }
        foreach($names as $name) {
            $nameArray = split('[ ]+', $name);
            array_push($classNames, $nameArray[1]);
        }
        return $classNames;
    }
    
    public function getActionNames()
    {
        $files = $this->getControllerClassFiles();
        $actionNames = array();
        foreach($files as $file) {
        	$names = array();
            $data = file($this->dir.DIRECTORY_SEPARATOR.$file, FILE_IGNORE_NEW_LINES);
            foreach(array_filter($data, "filterActionFunction") as $key) {
                array_push($names, $key);
            }
            $className = $this->getControllerClassName($this->dir.DIRECTORY_SEPARATOR.$file);
            $actionNames[$className] = array();
	        foreach($names as $name) {
	            $nameArray = split('[ ]+|\(', $name);
	            $data = array_filter($nameArray, "filterActionName");
	            array_push($actionNames[$className], current($data));
	        }
        }
        return $actionNames;
    }
    
    private function getControllerClassName($file)
    {
    	$names = array();
    	$classNames = array();
        $data = file($file, FILE_IGNORE_NEW_LINES);
        foreach(array_filter($data, "filterClassName") as $key) {
            array_push($names, $key);
        }
        foreach($names as $name) {
            $nameArray = split('[ ]+', $name);
            array_push($classNames, $nameArray[1]);
        }
        if(empty($classNames)) {
        	return;
        } else {
            return $classNames[0];
        }
    }
}

function filterClassFile($var)
{
    preg_match('/.*Controller.php$/', $var, $matches);
    return $matches;
}

function filterActionFunction($var)
{
    preg_match('/.*function.*Action[\s]*\(/', $var, $matches);
    return $matches;
}

function filterClassName($var)
{
    preg_match('/^[\s]*class[\s]+[A-Za-z_0-9]+/', $var, $matches);
    return $matches;
}

function filterActionName($var)
{
    preg_match('/.*Action$/', $var, $matches);
    return $matches;
}
