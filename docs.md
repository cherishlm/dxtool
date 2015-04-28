###把某个目录当作库地址
$LOAD_PATH.unshift(File.dirname(__FILE__)) unless $LOAD_PATH.include?(File.dirname(__FILE__))  
###饮用某个文件
require_relative

