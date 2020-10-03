<?php
namespace app\admin\Controller;
use think\Controller;
use think\Loader;
use app\admin\controller\Base;
use think\Session;

/**
 *
 */
class Message extends Base
{

    public function index()
    {
        return view();
    }

    //列表
    public function lst()
    {
        $user =Session::get('message');


            $lists = db('message')->order('id desc')-> paginate(20);




        $this->assign([
            'lists'  =>  $lists,
            
        ]);
        return view();
    }
    //删除
    public function del()
    {

        if(db('message')->where('id',input('id'))->delete()){
            return json(array("status"=>1,'msg'=>"删除成功!"));
        }else{
            return json(array("status"=>0,'msg'=>"删除失败!"));

        }
    }

    //配置页
    public function page()
    {

        //判断是否ajax提交
        if(request()->isAjax()){
            $data = input('post.');


            foreach ($data as $key => $val){
                db('message') ->where('ename',$key)->update(['value'=>$val]);


            }

            return true;
        }
        //获取message_type数据
        $type_list = db('message_type') -> select();

        foreach ($type_list as $k => $v) {

            $type_list[$k]['disploy'] = db('message') ->where('status',1)-> where('type_id',$v['id']) -> select();

        }
        // dump($type_list);
        $this -> assign([
            'type_list'	=>	$type_list,
        ]);

        return view();
    }

    //上传图片处理
    public function upimg()
    {
        $file = request()->file('website_logo');
        // 移动到框架应用根目录/public/uploads/ 目录下
        if($file){
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads'.DS . 'message');
            if($info){
                // 成功上传后 获取上传信息

                //保存到数据库的路径
                $filepath = '/uploads/message/'.$info->getSaveName();
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


        $data['status'] = input('post.status');
        $data['id']     = input('post.id');


        if($data['status'] == 1){
            db('message') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }else if($data['status'] == 0){
            db('message') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }

    public function changeState()
    {
        $data['status'] = input('post.status');
        $data['ename']     = input('post.id');

        if($data['status'] == 1){
            db('message') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }else if($data['status'] == 0){
            db('message') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }


    //后台留言
    public function add()
    {
        if(request()->isPost()){

        $data = input('desc');
        $ip = get_real_ip();

        $res = db('admin_comment')->where('ip',$ip)->where('time','>=',time()-300)->find();
        if($res){
            return json(array("status" => 0, 'msg' => "留言不久 休息一会儿!"));
        }
        $locationArr = \Ip::find($ip);
        $location = is_array($locationArr) ? implode(' ', $locationArr) : $locationArr;

        if (!preg_match('/^[\x7f-\xffA-Za-z0-9_]+$/', $data)) {
            return json(array("status" => 0, 'msg' => "留言字符非法!"));
        }
        $data = array(
            'desc' => $data,
            'ip'=> $ip,
            'location' => $location,
            'time' => time(),
            'type' => isMobile(),
        );

        if(db('admin_comment')->insert($data)){
            return json(array("status"=>1,'msg'=>"留言成功!"));
        }else {
            return json(array("status" => 0, 'msg' => "留言失败!"));
        }
        }
    }
}