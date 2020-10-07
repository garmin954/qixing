<?php
namespace app\admin\Controller;
use think\Config;
use think\Controller;
use think\Loader;
use app\admin\controller\Base;
/**
 *
 */
class Article extends Base
{

    public function index()
    {
        return view();
    }

    //列表
    public function lst()
    {
        //获取列表
        if( input('cate_id')){
            $lists = db('article')->order('id desc')->order('sort asc')->where('cate_id',input('cate_id'))->select();
            $nums = db('article')->where('cate_id',input('cate_id'))-> count();

        }else{
            $lists = db('article')->order('id desc')->select();
            $nums = db('article')-> count();
        }



        $this->assign([
            'lists'  =>  $lists,
            'nums'   =>  $nums,
        ]);
        return view();
    }

    //字体
    public function add()
    {

        if(Request()->isPost()){

            $data = input('post.');
            $validate = Loader::validate('article');
            if(!$validate->check($data)){
                return json(array("status"=>0,'msg'=>$validate->getError()));
            }
            $data['tag'] = isset($data['tag'])?implode(',',$data['tag']):'';

            $data['add_time'] = time();
            //插入数据库
            if(db('article')->insert($data)){

                return json(array("status"=>1,'msg'=>"添加成功!"));
            }else{
                return json(array("status"=>0,'msg'=>"添加失败!"));

            }

        }

        $yxzx = Config::get('home_category_id')['yxzx'];
        if (intval(input('cate_id')) == $yxzx) {
            //热门国家
            $pids = '1,2,3,4,5,6';
            $country = db('cate')->where(['status'=>1,'pid'=>['in',$pids]])->select();
            $this->assign('country', $country);
        }

        $this->assign([            'yxzx' => $yxzx,
        ]);
        $tag_list = db('tag') -> where('status',1) -> select();
        $this->assign('tag_list',$tag_list);
        return view();
    }

    public function uploadList()
    {

        $result = uploads('album',array('700,630'),'thumb');
        $thumb = str_replace('\\','/',explode('uploads\\',$result[1]));
        @unlink($result[1]);
        return 'uploads/'.$result[0];
    }


    public function delImg(){
        $str = input('img');
        $addr = ROOT_PATH.'/public/'.$str;
        @unlink($addr);
    }



    //编辑
    public function edit()
    {
        if(Request()->isPost()){

            $data = input('post.');

            $data['top'] = isset($data['top'])?$data['top']:0;
            $validate = Loader::validate('article');
            if(!$validate->check($data)){
                return json(array("status"=>0,'msg'=>$validate->getError()));
            }
            $data['tag'] = isset($data['tag'])?implode(',',$data['tag']):'';
            //插入数据库
            if(db('article')->where('id',input('id'))->update($data) !== false){

                return json(array("status"=>1,'msg'=>"修改成功!"));
            }else{
                return json(array("status"=>0,'msg'=>"修改失败!"));

            }

        }

        $yxzx = Config::get('home_category_id')['yxzx'];
            //热门国家
            $pids = '1,2,3,4,5,6';
            $country = db('cate')->where(['status'=>1,'pid'=>['in',$pids]])->select();
            $this->assign('country', $country);


        $tag_list = db('tag') -> where('status',1) -> select();
        $this->assign('tag_list',$tag_list);
        if(input('id')){
            $lists = db('article') -> where('id',input('id'))->find();
            $this->assign([
                'show' => $yxzx==$lists['cate_id'] ? true : false,
        ]);
            $this->assign('lists',$lists);

        }
        return view();
    }

    public function delImgs($str){

        $addr = ROOT_PATH.'/public/'.$str;
//        dump($addr);
        @unlink($addr);
    }
    //删除
    public function del($ids='')
    {
        if($ids==''){
            $id=input('id');
        }else{
            $id = $ids;
        }
        $info = db('article')->where('id',$id)->find();
        //插入数据库
        if(db('article')->where('id',$id)->delete()){
            $this->delImgs($info['thumb']);
            $thumb_list = explode('yl',$info['thumb_list']);
            foreach ($thumb_list as $key => $val){
                @$this->delImgs($val);
            }
            if($ids== ''){return json(array("status"=>1,'msg'=>"删除成功!"));}

        }else{
            return json(array("status"=>0,'msg'=>"删除失败!"));
        }
    }





    public function backOut()
    {
        $path = input('path');

        if(unlink(ROOT_PATH.'public'.$path)){

            return json(array('status'=>1));
        }
    }




    //g改变状态
    public function changeStatus()
    {


        $data['status'] = input('post.status');
        $data['id']     = input('post.id');


        if($data['status'] == 1){
            db('article') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }else if($data['status'] == 0){
            db('article') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }

    public function changeState()
    {
        $data['status'] = input('post.status');
        $data['ename']     = input('post.id');

        if($data['status'] == 1){
            db('article') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }else if($data['status'] == 0){
            db('article') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }
}