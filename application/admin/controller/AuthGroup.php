<?php
namespace app\admin\Controller;
use think\Controller;
use think\Loader;
use app\admin\controller\Base;
/**
 *
 */
class AuthGroup extends Base
{
    public function index()
    {
        return view();
    }
    //列表
    public function lst()
    {
        $lists = db('auth_group')-> paginate(10);
        $nums = db('auth_group')-> count();


        $this->assign([
            'lists'  =>  $lists,
            'nums'   =>  $nums,
        ]);
        return view();
    }
    //删除
    public function del()
    {

        if(db('auth_group')->where('id',input('id'))->delete()){
            return json(array("status"=>1,'msg'=>"删除成功!"));
        }else{
            return json(array("status"=>0,'msg'=>"删除失败!"));

        }
    }

    //上传图片处理
    public function upimg()
    {
        $file = request()->file('website_logo');
        // 移动到框架应用根目录/public/uploads/ 目录下
        if($file){
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads'.DS . 'auth_group');
            if($info){
                // 成功上传后 获取上传信息

                //保存到数据库的路径
                $filepath = '/uploads/auth_group/'.$info->getSaveName();
                $data['website_logo'] = $filepath;
                return json($data);

            }else{
                // 上传失败获取错误信息
            }
        }
    }

    public function backOut()
    {
        $path = input('path');

        if(unlink(ROOT_PATH.'public'.$path)){

            return json(array('status'=>1));
        }
    }


    //列表
    public function test()
    {
        return view();
    }

    //g改变状态
    public function changeStatus()
    {
        $data['status'] = input('status');
        $data['id']     = input('id');

        if($data['status'] == 1){
            db('auth_group') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }else if($data['status'] == 0){
            db('auth_group') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }

    public function changeState()
    {
        $data['status'] = input('post.status');
        $data['ename']     = input('post.id');

        if($data['status'] == 1){
            db('auth_group') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }else if($data['status'] == 0){
            db('auth_group') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }


    public function add()
    {
        if(request()->isAjax()){
            $data = input('post.');
            unset($data['authority']);

            //插入数据库
            if(db('auth_group')->insert($data)){
                return json(array("status"=>1,'msg'=>"添加成功!"));
            }else{
                return json(array("status"=>0,'msg'=>"添加失败!"));
            }
        }


        $rules = db('auth_rule')->field('title,id,pid') ->select();
        $rule_top = db('auth_rule')->field('title,id,pid')->where('pid',0) ->select();

        $this->assign([
            'rules' => $rules,
            'rule_top' => $rule_top,

        ]);
        return view();
    }

    public function edit()
    {
        if(request()->isAjax()){
            $data = input('post.');
            unset($data['authority']);
            //插入数据库
            if(db('auth_group')->where('id',input('id'))->update($data) !== false){
                return json(array("status"=>1,'msg'=>"修改成功!"));
            }else{
                return json(array("status"=>0,'msg'=>"修改失败!"));
            }
        }

        $rules = db('auth_rule')->field('title,id,pid') ->select();
        $rule_top = db('auth_rule')->field('title,id,pid')->where('pid',0) ->select();
        $info = db('auth_group')->where('id',input('id'))->find();

        $this->assign([
            'rules' => $rules,
            'rule_top' => $rule_top,
            'info'  => $info,
        ]);

        return view();
    }

}