<?php
namespace app\admin\Controller;
use think\Controller;
use think\Loader;
use app\admin\controller\Base;
/**
 *
 */
class Images extends Base
{


    /*
     * ueditor上传的图片管理
     */
    public function imageList()
    {
        $result1 = $this->eu_scandir(config('u_editor'));
        $result2 = $this->eu_scandir(config('uploads'));
        $result = array_merge($result1, $result2);
        $result = ($this -> for_array($result2));

        $_result = array();
        foreach ($result as $key=>$file){
            if(is_array($file)){
                foreach ($file as $val){
                    $_result[] = str_replace(config('u_editor'),config('ueditor'),$val);
                }
            }else{
                $_result[] = str_replace(config('u_editor'),config('ueditor'),$file);
            }
        }

        foreach ($_result as &$val){

            $val = str_replace(ROOT_PATH,'/',$val);
        }
//        halt($_result);
        $this->assign([
            'list'  => $_result,
        ]);
        return view();
    }

    public function for_array($arr = array (), &$result = []) {


       if(empty($arr)) {
            return false;
       }

    foreach ($arr as  &$v) {
        if (is_array($v)) {
            $v = $this->for_array($v, $result);
        } else {
//            $v = $v;
            $result[] = $v;
        }
    }

    return $result;
    }

    /*
     * 获取ueditor的图片
     */

    public function eu_scandir($dir)
    {
        $dir_list = scandir($dir);
        $result =array();
        foreach ($dir_list as $key => $file){
            //文件
            if($file != '.' && $file != '..' ){

                if (is_dir($dir.'/'.$file)){

                    $result[] = $this->eu_scandir($dir.'/'.$file);

                }else{
                    $result[] = $dir.'/'.$file;
                }
            }
            //文件夹
        }
        return $result;
    }


    //ueditor图片删除
    public function delImage()
    {
        $path = input('path');
        $show = input('show')?input('show'):0;
        if(@unlink(ROOT_PATH.$path)){
            return json(array('status'=>1,'msg'=>'删除成功！','show'=>$show));
        }else{
            return json(array('status'=>0,'msg'=>'删除失败！','show'=>$show));
        }
    }

}