<?php
namespace app\admin\Controller;
use think\Controller;
use think\Loader;
use app\admin\controller\Base;
/**
 *
 */
class AuthRule extends Base
{

    public function index()
    {
        return view();
    }
    //列表
    public function lst()
    {
        $lists =  cateTree('auth_rule');
        $nums = db('auth_rule')-> count();
        $rules = db('auth_rule')->field('title,id,pid') ->select();
        $rule_top = db('auth_rule')->field('title,id,pid')->where('pid',0) ->select();


        $this->assign([
            'rules' => $rules,
            'rule_top' => $rule_top,
            'lists'  =>  $lists,
            'nums'   =>  $nums,
        ]);

        return view();
    }
    //删除
    public function del()
    {
        if(db('auth_rule')->where('id',input('id'))->delete()){
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
            db('auth_rule') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }else if($data['status'] == 0){
            db('auth_rule') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }

    public function changeState()
    {
        $data['status'] = input('post.status');
        $data['ename']     = input('post.id');

        if($data['status'] == 1){
            db('auth_rule') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }else if($data['status'] == 0){
            db('auth_rule') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }

    public function add()
    {
        if(request()->isAjax()){
            $data = input('post.');
            $arr = explode('-',$data['pid']);
            $data['pid'] = $arr[0];
            $data['level'] = $arr[1];

            //插入数据库
            if(db('auth_rule')->insert($data)){
                return json(array("status"=>1,'msg'=>"添加成功!"));
            }else{
                return json(array("status"=>0,'msg'=>"添加失败!"));
            }
        }

        return view();
    }

    public function edit()
    {
        $id = input('id');

        if(request()->isAjax()){
            $data = input('post.');
            $arr = explode('-',$data['pid']);
            $data['pid'] = $arr[0];
            $data['level'] = $arr[1];
            //插入数据库
            if(db('auth_rule')->where('id',input('id'))->update($data) !== false){
                return json(array("status"=>1,'msg'=>"修改成功!"));
            }else{
                return json(array("status"=>0,'msg'=>"修改失败!"));
            }
        }
        $info = db('auth_rule')->where('id',$id)->find();
        $this->assign([
            'info'  => $info
        ]);
        return view();
    }

    public function sortAll()
    {
        $data = input('post.');

        foreach ($data['sort'] as $key=>$val){
//            var_dump($key);
            db('auth_rule')->where('id',$key)->update(['sort'=>$val]);
        }
        return json(array("status"=>1,'msg'=>"排序成功!"));

    }
}