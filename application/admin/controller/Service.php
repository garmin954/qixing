<?php
namespace app\admin\Controller;
use think\Controller;
use think\Loader;
use app\admin\controller\Base;
/**
* 
*/
class Service extends Base
{
	
	public function index()
	{
		return view();
	}


	//列表
	public function lst()
	{
        $nums = db('service')-> count();
        $lists = db('service')-> paginate(10);

        $this->assign([
            'lists'  =>  $lists,
            'nums'   =>  $nums,
        ]);
		return view();
	}


	public function do_upload()
    {
        //引入文件
        \think\Loader::import('Classes.PHPExcel');
//        $objPHPExcel = new \PHPExcel();
        $objPHPExcel = new \PHPExcel();

        //获取表单上传文件
        $file = request()->file('file');
        $info = $file->validate(['ext' => 'xlsx,xls'])->move(ROOT_PATH . 'public' . DS . 'uploads');

        //数据为空返回错误
        if(empty($info)){
            $output['status'] = false;
            $output['info'] = '导入数据失败~';
            $this->ajaxReturn($output);
        }

        //获取文件名
        $exclePath = $info->getSaveName();
        //上传文件的地址
        $filename = ROOT_PATH . 'public' . DS . 'uploads'.DS . $exclePath;


        $extension = strtolower( pathinfo($filename, PATHINFO_EXTENSION) );

        \think\Loader::import('PHPExcel.IOFactory.PHPExcel_IOFactory');
        if ($extension =='xlsx') {
            $objReader = new \PHPExcel_Reader_Excel2007();
            $objExcel = $objReader ->load($filename);

        } else if ($extension =='xls') {

            $objReader = new \PHPExcel_Reader_Excel5();
            $objExcel = $objReader->load($filename);


        }


        $excel_array=$objExcel->getsheet(0)->toArray();   //转换为数组格式
        array_shift($excel_array);  //删除第一个数组(标题);
//        array_shift($excel_array);  //删除th
        $data=[];
        foreach ($excel_array as $k=>$v){
            $data[$k]["number"]=$v[0];//单号
            $data[$k]["name"]=$v[1];//类型名称
            $data[$k]["time"]=strtotime($v[2]);
            $data[$k]["info"]=$v[3];
            $data[$k]["memo"]=$v[4];
        }

        $res = db('service')->insertAll($data);
        if (!$res){
            return json(['code'=>0, 'msg' => '失败！']);
        }
        $msg=[
            'code'=>1,
            'msg'=>'已获取信息',
        ];
        $msg['data']['src']=$filename;
        $msg['data']['data']=$data;

        return json($msg);

    }

	//字体
	public function add()
	{
		if(Request()->isPost()){

			$data = input('post.');
            $data['time'] = time();
			//插入数据库
			if(db('service')->insert($data)){

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
            //插入数据库
            if(db('service')->where('id',input('id'))->update($data) !==false){

                return json(array("status"=>1,'msg'=>"修改成功!"));
            }else{
                return json(array("status"=>0,'msg'=>"修改失败!"));

            }
        }
        if(input('id')){
            $lists = db('service') -> where('id',input('id'))->find();

            $this->assign('lists',$lists);
        }
        return view();
    }

    //删除
    public function del()
    {
            //插入数据库
            if(db('service')->where('id',input('id'))->delete()){
                return json(array("status"=>1,'msg'=>"删除成功!"));
            }else{
                return json(array("status"=>0,'msg'=>"删除失败!"));
            }
    }
//删除
    public function delAll()
    {
        //插入数据库
        if(db('service')->where('id','in',input('id'))->delete()){
            return json(array("status"=>1,'msg'=>"删除成功!"));
        }else{
            return json(array("status"=>0,'msg'=>"删除失败!"));
        }
    }
}