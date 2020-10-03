<?php
namespace app\admin\Controller;
use think\Controller;
use app\admin\controller\Base;
use think\Session;

/**
*
*/
class Index extends Base
{

	public function index()
	{

		return view();
	}

		//字体
	public function welcome()
	{
	    $this->getOS();
	    $this->getVisit();
        $this->getWith();
        $this->getArtList();
        $this->getMessage();

//        dump($result);
		return view();
	}

	public function getMessage()
    {
        $list  = db('admin_comment')->order('top desc')->order('time desc')->where('status',1)->paginate(5);

        $this->assign('admin_message',$list);
    }

    public function getArtList()
    {
        $list =array();
        $list['article'] = db('article')->where('status',1)->limit(10)->select();
        $list['message'] = db('message')->where('status',1)->limit(10)->select();
        $list['admin_log'] = db('admin_log')->order('id desc')->limit(10)->paginate(15);


        $this->assign([
            'art_list' => $list
        ]);
    }
	public function getWith()
    {
        $visit =$message= 0;
        $article = db('article')->where('status',1)->count();
        $user = db('user')->where('status',1)->count();
        $visit = db('visit_count')->where('time','egt',strtotime(date('Ymd')))->order('time desc')->value('count');


//        dump($visit);
        $result = array(


            '今日浏览人数' => $visit,
            '未查看账号数量' => $message,
        );
        $this->assign([
            'with' => $result
        ]);
    }

	public function  getVisit()
    {
        $list = db('visit_count')->limit(7)->order('time desc')->select();
        $result = array();
        $result['count'] =$result['pc']=$result['mobile']=$result['day'] = array();
        foreach ($list as $key=>$val){
            array_unshift($result['count'],$val['count']);
            array_unshift($result['pc'],$val['pc']);
            array_unshift($result['mobile'],$val['mobile']);
            array_unshift($result['day'],date('m月d日',$val['time']));
        }

        $this->assign([
            'visit' => $result
        ]);
    }
	public function getOS()
    {
        $info = array(
            '操作系统'=>PHP_OS,
            'PHP版本'=> PHP_VERSION,
            'MYSQL版本'=>  $this-> _mysql_version(),
//            'Apache版本'=> apache_get_version(),

            '运行环境'=>$_SERVER["SERVER_SOFTWARE"],
            'PHP运行方式'=>php_sapi_name(),
            'ThinkPHP版本'=>THINK_VERSION.' [ <a href="http://thinkphp.cn" target="_blank">查看最新版本</a> ]',
            '上传附件限制'=>ini_get('upload_max_filesize'),
            '执行时间限制'=>ini_get('max_execution_time').'秒',
            '服务器时间'=>date("Y年n月j日 H:i:s"),

            '服务器域名/IP'=>$_SERVER['SERVER_NAME'].' [ '.gethostbyname($_SERVER['SERVER_NAME']).' ]',
            '剩余空间'=>'0M',
            'register_globals'=>get_cfg_var("register_globals")=="1" ? "ON" : "OFF",
            'magic_quotes_gpc'=>(1===get_magic_quotes_gpc())?'YES':'NO',
            'magic_quotes_runtime'=>(1===get_magic_quotes_runtime())?'YES':'NO',
        );

        $this->assign('OS_info',$info);
    }
    private function _mysql_version()
    {
        $db_info =  include(APP_PATH.'/database.php');
        $con = mysqli_connect($db_info['hostname'],$db_info['username'],$db_info['password']);
        $version = mysqli_get_server_info($con);
        mysqli_close($con);
        return  $version;
    }

    //后台留言
    public function add()
    {
        if(request()->isPost()){

            $data = input('desc');
            $ip = get_real_ip();
            $locationArr = \Ip::find($ip);
            $location = is_array($locationArr) ? implode(' ', $locationArr) : $locationArr;
            if (!preg_match('/^[a-zA-Z0-9?!@-\x7f-\xff]', $data)) {
                return json(array("status" => 0, 'msg' => "留言字符非法!"));
            }
            $data = array(
                'desc' => $data,
                'ip'=> $ip,
                'location' => $location,
                'time' => time(),
                'type' => isMobile(),
            );

            if(db('comment')->insert($data)){
                return json(array("status"=>1,'msg'=>"留言成功!"));
            }else {
                return json(array("status" => 0, 'msg' => "留言失败!"));
            }
        }
    }

	//字体
	public function fonts()
	{
		return view();
	}
    //字体
    public function getTime()
    {
        return view();
    }

    public function test()
    {
        getUpper('AuthRule');
    }

//    public function getLeftNav()
//    {
//
//        $list = $this->cateTree('auth_rule');
////        dump($list);
//        $this->assign('left_nav',$list);
//    }

//
//    function cateTree($dbname,$pid=0)
//    {
//
//            $data = db($dbname)->order('sort asc')->where('status',1)->where('types','>=',1)->select();
//
//            return  $this->getChildren($data,$pid);
//
//    }
//
//
//    function getChildren($data,$pid,$level=0)
//    {
//        static $result = array();
//        foreach ($data as $key=>$val){
//            if($pid == $val['pid']){
//                $val['level']     = $level;
//                $result[$val['id']]     = $val;
//
//                $this->getChildren($data,$val['id'],$level+1);
//            }
//        }
//        return $result;
//    }
}