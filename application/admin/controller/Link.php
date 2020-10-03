<?php
namespace app\admin\Controller;
use think\Controller;
use think\Loader;
use app\admin\controller\Base;
/**
* 
*/
class Link extends Base
{
	
	public function index()
	{
		return view();
	}


    public function sortAll()
    {
        $data = input('post.');

        foreach ($data['sort'] as $key=>$val){
//            var_dump($key);
            db('link')->where('id',$key)->update(['sort'=>$val]);
        }
        return json(array("status"=>1,'msg'=>"排序成功!"));

    }
	//列表
	public function lst()
	{
        $nums = db('link')-> count();
        $lists = db('link')->order('sort asc')-> select();

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
            $validate = Loader::validate('link');
            if(!$validate->scene('task')->check($data)){
                return json(array("status"=>0,'msg'=>$validate->getError()));
            }

			//插入数据库
			if(db('link')->insert($data)){

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


            $validate = Loader::validate('link');
            if(!$validate->scene('task')->check($data)){
                return json(array("status"=>0,'msg'=>$validate->getError()));

            }
            //插入数据库
            if(db('link')->where('id',input('id'))->update($data) !==false){

                return json(array("status"=>1,'msg'=>"修改成功!"));
            }else{
                return json(array("status"=>0,'msg'=>"修改失败!"));

            }

        }

        if(input('id')){
            $lists = db('link') -> where('id',input('id'))->find();

            $this->assign('lists',$lists);

        }
        return view();
    }


    //删除
    public function del()
    {
            //插入数据库
            if(db('link')->where('id',input('id'))->delete()){
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
            db('link') ->where('ename',$key)->update(['value'=>$val]);


            }

            return true;
        }
		//获取link_type数据
		$type_list = db('link_type') -> select();
		
		foreach ($type_list as $k => $v) {
			
			$type_list[$k]['disploy'] = db('link') ->where('status',1)-> where('type_id',$v['id']) -> select();

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
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads'.DS . 'link');
            if($info){
                // 成功上传后 获取上传信息

                //保存到数据库的路径
                $filepath = '/uploads/link/'.$info->getSaveName();
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
            db('link') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }else if($data['status'] == 0){
            db('link') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }

    public function changeState()
    {
        $data['status'] = input('post.status');
        $data['ename']     = input('post.id');

        if($data['status'] == 1){
            db('link') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }else if($data['status'] == 0){
            db('link') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }
}