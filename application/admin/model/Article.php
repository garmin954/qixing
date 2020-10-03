<?php
namespace app\admin\Model;
use think\Model;

class Cate extends Model{

    /*-----------------------------无限分类-------------------------*/

    public function cateTree()
    {
        //获取所有栏目id
        $cate_list = db('cate')->select();

        return $this-> cateSort($cate_list);
    }

    //排序
    public function cateSort($data,$pid=0,$level=0)
    {
        //设置静态数组存储栏目
        static $arr = array();
        //循环
        foreach ($data as $key=> $val){
            //判断
            if($val['pid'] == $pid){
                $val['level'] = $level;
                $arr[]        = $val;

                $this-> cateSort($data,$val['id'],$level+1);
            }
        }
        return $arr;

    }

    /*-------------------获取当前栏目及其子栏目------------------------------*/

    public function cateChildren()
    {
        $cid = input('id');

        $cate_list = db('cate')->select();
        $new_cate  = $this-> getChildren($cate_list,$cid);

        array_push($new_cate,db('cate')->find($cid));

        return $new_cate;
    }

    //获取子栏目
    public function getChildren($data,$pid)
    {
        //设置静态数组存储栏目
        static $arr = array();
        //循环
        foreach ($data as $key=> $val){
            //判断
            if($val['pid'] == $pid){

                $arr[]        = $val;

                $this-> getChildren($data,$val['id']);
            }
        }
        return $arr;
    }

    /*----------------------------栏目删除及其栏目图片删除-------------------*/

    public function delCate()
    {
        $cates = $this-> cateChildren();


        //循环
        foreach ($cates as $key=>$val){
            //删除图片
            if($val['cate_img'] != null){
                unlink(ROOT_PATH.'public'.$val['cate_img']);
            }

            //删除栏
            $this:: destroy($val['id']);
        }
    }


    /*----------------------一键排序-------------------------*/

    public function oneKeySort()
    {
        //获取所有的id
        $ids = input('cates');
        foreach ($ids as $key=>$val){

            db('cate') -> where('id',$val['id'])-> update(['sort'=>$val['sort']]);
        }
    }


}