<?php
namespace app\admin\Controller;
use think\Controller;
use think\Loader;
use app\admin\controller\Base;
use think\Session;

/**
 *
 */
class Admin extends Base
{

    public function index()
    {
        return view();
    }

    //列表
    public function lst()
    {

        $lists = db('admin')->order('id asc')-> select();
        unset($lists[0]);

        $nums = db('admin')-> count();
        //最近登录时间
        foreach ($lists as $key=>&$val){
            $val['time'] = db('login_log')->where('uid',$val['id'])->order('id desc')->limit(1)->value('time');
        }
        $group = db('auth_group')->where('status',1)->select();

        $this->assign([
            'lists'  =>  $lists,
            'nums'   =>  $nums,
            'group' => $group
        ]);
        return view();
    }
    //删除
    public function del()
    {

        if(db('admin')->where('id',input('id'))->delete()){
            return json(array("status"=>1,'msg'=>"删除成功!"));
        }else{
            return json(array("status"=>0,'msg'=>"删除失败!"));

        }
    }



    //g改变状态
    public function changeStatus()
    {
        $data['status'] = input('post.status');
        $data['id']     = input('post.id');


        if($data['status'] == 1){
            db('admin') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }else if($data['status'] == 0){
            db('admin') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }

    public function changeState()
    {
        $data['status'] = input('post.status');
        $data['ename']     = input('post.id');

        if($data['status'] == 1){
            db('admin') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }else if($data['status'] == 0){
            db('admin') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }


    public function add()
    {
        if(request()->isAjax()){
            $data = input('post.');

            $group_id = $data['group'];

            $data['password'] = md5($data['password']);
            unset($data['group']);
            $id = db('admin')->insertGetId($data);
            if($id){
                foreach ($group_id as $val){
                    db('auth_group_access')->insert(['uid'=>$id,'group_id'=>$val]);
                }
                return json(array("status"=>1,'msg'=>"添加成功!"));
            }else{
                return json(array("status"=>0,'msg'=>"添加失败!"));
            }

        }
        $group = db('auth_group')->order('id asc')->where('status',1)->select();
        $user = Session::get('user_info');
        if($user['username'] !== 'yuanlu'){unset($group[0]);}
        $this->assign([
            'group' => $group
        ]);
        return view();
    }

    public function edit()
    {
        $id = input('id');
        if(request()->isAjax()){
            $data = input('post.');
            $group_id = $data['group'];
            if(empty($data['password'])){
                unset($data['password']);
            }else{
                $data['password'] = md5($data['password']);
            }
            unset($data['group']);
            $res = db('admin')->where('id',$id)->update($data);
            if($res !== false){
                db('auth_group_access')->where('uid',$id)->delete();
                foreach ($group_id as $val){
                    db('auth_group_access')->insert(['uid'=>$id,'group_id'=>$val]);
                }
                return json(array("status"=>1,'msg'=>"修改成功!"));
            }else{
                return json(array("status"=>0,'msg'=>"修改失败!"));
            }

        }
        $group = db('auth_group')->order('id asc')->where('status',1)->select();
        $user = Session::get('user_info');
        if($user['username'] !== 'yuanlu'){unset($group[0]);}
        $group_access = db('auth_group_access')->where('uid',$id)->select();
        $access =array();
        foreach ($group_access as &$val){
            $access[] = $val['group_id'];
        }


        $info = db('admin')->where('id',$id)->find();
        $this->assign([
            'group' => $group,
            'info'  => $info,
            'group_access' => implode(',',$access),
        ]);
        return view();
    }
}