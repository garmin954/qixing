<?php
namespace app\admin\Controller;
use think\Controller;
use think\Loader;
use app\admin\controller\Base;
/**
* 
*/
class Advert extends Base
{
	
	public function index()
	{
		return view();
	}

	//列表
	public function lst()
	{
        $nums = db('advert')-> count();
        $lists = db('advert')-> select();

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
            $validate = Loader::validate('advert');
            if(!$validate->check($data)){
                return json(array("status"=>0,'msg'=>$validate->getError()));
            }

			//插入数据库
			if(db('advert')->insert($data)){

				return json(array("status"=>1,'msg'=>"添加成功!"));
			}else{
				return json(array("status"=>0,'msg'=>"添加失败!"));
			}
		}


		return view();
	}

    //编辑
    public function edit()
    {


        if(Request()->isPost()){

            $data = input('post.');


            $validate = Loader::validate('advert');
            if(!$validate->check($data)){
                return json(array("status"=>0,'msg'=>$validate->getError()));

            }
            //插入数据库
            if(db('advert')->where('id',input('id'))->update($data) !==false){

                return json(array("status"=>1,'msg'=>"修改成功!"));
            }else{
                return json(array("status"=>0,'msg'=>"修改失败!"));

            }

        }

        if(input('id')){
            $lists = db('advert') -> where('id',input('id'))->find();

            $this->assign('lists',$lists);

        }
        return view();
    }


    //删除
    public function del()
    {
            //插入数据库
            if(db('advert')->where('id',input('id'))->delete()){
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
            db('advert') ->where('ename',$key)->update(['value'=>$val]);


            }

            return true;
        }
		//获取advert_type数据
		$type_list = db('advert_type') -> select();
		
		foreach ($type_list as $k => $v) {
			
			$type_list[$k]['disploy'] = db('advert') ->where('status',1)-> where('type_id',$v['id']) -> select();

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
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads'.DS . 'advert');
            if($info){
                // 成功上传后 获取上传信息

                //保存到数据库的路径
                $filepath = '/uploads/advert/'.$info->getSaveName();
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
            db('advert') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }else if($data['status'] == 0){
            db('advert') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }

    public function changeState()
    {
        $data['status'] = input('post.status');
        $data['ename']     = input('post.id');

        if($data['status'] == 1){
            db('advert') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }else if($data['status'] == 0){
            db('advert') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }
}