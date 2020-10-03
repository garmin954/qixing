<?php
namespace app\admin\Controller;
use think\Controller;
use think\Loader;
use app\admin\controller\Base;
use app\admin\Controller\Aritcle;
/**
*
*/
class Cate extends Base
{

	public function index()
	{
		return view();
	}

	//列表
	public function lst()
	{
	    //获取列表
        $lists = cateTree('cate');


        $nums = db('cate')-> count();
        $cate_list = db('cate')->field('id,cate_name')-> select();

        $this->assign([
            'lists'  =>  $lists,
            'nums'   =>  $nums,
            'cate_list'  =>  $cate_list,
        ]);
		return view();
	}

	//字体
	public function add()
	{

		if(Request()->isPost()){

			$data = input('post.');
            $validate = Loader::validate('cate');
            if(!$validate->check($data)){
                return json(array("status"=>0,'msg'=>$validate->getError()));

            }
			$data['create_time'] = time();

			//插入数据库
			if(db('cate')->insert($data)){

				return json(array("status"=>1,'msg'=>"添加配置成功!"));
			}else{
				return json(array("status"=>0,'msg'=>"添加配置失败!"));

			}

		}
        $cate_list = db('cate')->field('id,cate_name')-> select();
        $this->assign([
            'cate_list'  =>  $cate_list,

        ]);
		return view();
	}

    //编辑
    public function edit()
    {


        if(Request()->isPost()){

            $data = input('post.');
            if($data['pid'] ==input('id')){
                return json(array("status"=>0,'msg'=>"上级栏目不能选择自己!"));
            }

            $validate = Loader::validate('cate');
            if(!$validate->check($data)){
                return json(array("status"=>0,'msg'=>$validate->getError()));

            }
            //插入数据库
            if(db('cate')->where('id',input('id'))->update($data) !==false){

                return json(array("status"=>1,'msg'=>"修改配置成功!"));
            }else{
                return json(array("status"=>0,'msg'=>"修改配置失败!"));

            }

        }

        if(input('id')){
            $lists = db('cate') -> where('id',input('id'))->find();

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
    public function del()
    {
        $cate_son = cateTree('cate',input('id'),true);

        foreach ($cate_son as $val){
            $info = db('cate')->where('id',$val['id'])->find();
            if(db('cate')->where('id',$val['id'])->delete()) {
                $this->delImgs($info['thumb']);
                $art_list = db('article')->where('cate_id', $val['id'])->field('id')->select();
                foreach ($art_list as $art) {
//                dump($art['id']);
                    $article = new Article();
                    $article->del($art['id']);
                }
            }
        }
        return json(array("status"=>1,'msg'=>"删除成功!"));
    }

	//配置页
	public function page()
	{

	    //判断是否ajax提交
        if(request()->isAjax()){
            $data = input('post.');


            foreach ($data as $key => $val){
            db('cate') ->where('ename',$key)->update(['value'=>$val]);


            }

            return true;
        }
		//获取cate_type数据
		$type_list = db('cate_type') -> select();

		foreach ($type_list as $k => $v) {

			$type_list[$k]['disploy'] = db('cate') ->where('status',1)-> where('type_id',$v['id']) -> select();

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
            $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads'.DS . 'cate');
            if($info){
                // 成功上传后 获取上传信息

                //保存到数据库的路径
                $filepath = '/uploads/cate/'.$info->getSaveName();
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
            db('cate') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }else if($data['status'] == 0){
            db('cate') ->where('id',$data['id'])-> update(['status' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }

    public function changeState()
    {
        $data['status'] = input('post.status');
        $data['ename']     = input('post.id');

        if($data['status'] == 1){
            db('cate') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }else if($data['status'] == 0){
            db('cate') ->where('ename',$data['ename'])-> update(['value' =>$data['status']]);
        }
        $str = "成功";
        return json($str);
    }

    public function sortAll()
    {
        $data = input('post.');

        foreach ($data['sort'] as $key=>$val){
//            var_dump($key);
            db('cate')->where('id',$key)->update(['sort'=>$val]);
        }
        return json(array("status"=>1,'msg'=>"排序成功!"));

    }

    
}
