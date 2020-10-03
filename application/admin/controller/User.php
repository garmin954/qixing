<?php
namespace app\admin\Controller;
use think\Controller;
use app\admin\controller\Base;
use think\Session;

/**
* 
*/
class User extends Base
{
	
	public function index()
	{
		return view();
	}
    //列表
    public function lst()
    {

        $lists = db('user')-> paginate(20);
        $nums = db('user')-> count();



        $this->assign([
            'lists'  =>  $lists,
            'nums'   =>  $nums,

        ]);
        return view();
    }

    //删除
    public function del()
    {

        if(db('user')->where('id',input('id'))->delete()){
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
            db('user') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }else if($data['status'] == 0){
            db('user') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }

    public function changeState()
    {
        $data['status'] = input('post.status');
        $data['ename']     = input('post.id');

        if($data['status'] == 1){
            db('user') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }else if($data['status'] == 0){
            db('user') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }
}