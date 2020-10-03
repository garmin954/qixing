<?php
namespace app\admin\Controller;
use think\Controller;
use think\Db;
use think\Loader;
use app\admin\controller\Base;
use think\Request;

/**
* 
*/
class Generate extends Base
{
	
	public function index()
	{
        $tables = Db::getTables();
//        dump($tables);

        //获取顶级栏目
        $top_cate = db('auth_rule')->where('pid',0)->select();

        //管理组
        $group = db('auth_group')->select();

        //提交创建
        if (Request()->isPost()){
            $data = \request()->param();
            \Generate::run($data);
        }
        $this->assign([
            'top_cate' => $top_cate,
            'group' => $group,
        ]);
		return view();
	}


}