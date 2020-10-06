<?php
namespace app\admin\Controller;
use think\Controller;
use app\admin\controller\Base;
use think\Session;

/**
* 
*/
class SystemType extends Base
{
	
	public function index()
	{
		return view();
	}
    //列表
    public function lst()
    {

        $lists = db('system_type')-> paginate(20);
        $nums = db('system_type')-> count();



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
            $data['value'] = trim(str_replace('/','/',$data['value']));
            $data['values'] = trim(str_replace('/','/',$data['values']));

            //插入数据库//
            if(db('system_type')->insert($data)){

                return json(array("status"=>1,'msg'=>"添加成功!"));
            }else{
                return json(array("status"=>0,'msg'=>"添加失败!"));

            }

        }
        $system_type_list = db('system_type')->select();
        $this->assign([
            'system_type_list'  =>  $system_type_list,

        ]);
        return view();
    }

    //编辑
    public function edit()
    {


        if (Request()->isPost()) {

            $data = input('post.');
//            $data['value'] = trim(str_replace('/','/',$data['value']));
//            $data['values'] = trim(str_replace('/','/',$data['values']));
            //插入数据库
            if (db('system_type')->where('id', input('id'))->update($data)!==false) {

                return json(array("status" => 1, 'msg' => "修改配置成功!"));
            } else {
                return json(array("status" => 0, 'msg' => "修改配置失败!"));

            }

        }

            $lists = db('system_type') -> where('id',input('id'))->find();

            $this->assign('info',$lists);
            return view();

    }


        //删除
    public function del()
    {

        if(db('system_type')->where('id',input('id'))->delete()){
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
            db('system_type') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }else if($data['status'] == 0){
            db('system_type') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }

    public function changeState()
    {
        $data['status'] = input('post.status');
        $data['ename']     = input('post.id');

        if($data['status'] == 1){
            db('system_type') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }else if($data['status'] == 0){
            db('system_type') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }
    public function sortAll()
    {
        $data = input('post.');

        foreach ($data['sort'] as $key=>$val){
//            var_dump($key);
            db('system_type')->where('id',$key)->update(['sort'=>$val]);
        }
        return json(array("status"=>1,'msg'=>"排序成功!"));

    }
}