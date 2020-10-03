<?php
/**
 * Created by PhpStorm.
 * User: 15490
 * Date: 2019/1/21
 * Time: 19:29
 */
namespace app\common\controller;
use think\Controller;

class Base extends Controller
{
    public function _initialize()
    {

        $this->visitCount();
        $this->getConfig();

        parent::_initialize(); // TODO: Change the autogenerated stub
    }

    //扣除余额

    //获取系统参数
    public function getConfig()
    {
        $config = db('system')->select();
        $result = array();
        foreach ($config as $key=>$val){
            $result[$val['ename']] = str_replace('\\','/',$val['value']);
        }
//        dump($result);
        $this ->assign('config',$result);
//        return $result;
    }

    public function visitCount()
    {
        $ip = get_real_ip();
        $type = $this->isMobile();

        $client = $this->getBrowser();

        $res = db('visit_log')->where(['ip'=>$ip,'type'=>$type,'client'=>$client])->where('time','gt',time()-900)->limit('1')->find();
        if($res){
            return false;
        }
        $data = array(
            'ip'=>$ip,
            'time'=>time(),
            'client'=>$client,
            'type'=> $type
        );
        if(db('visit_log')->insert($data)){
            $res = db('visit_count')->where('time','egt',strtotime(date('Ymd')))->find();
            if(!$res){
                db('visit_count')->insert(['time'=>time()]);
            }
            if($type == 'pc' ){
                $pc = $res['pc']+1;$mobile=$res['mobile']+0;
            }else{
                $pc = $res['pc']+0;$mobile=$res['mobile']+1;
            }
            $data = array(
                'count' => $res['count']+1,
                'pc'   => $pc,
                'mobile'   => $mobile,
            );
            db('visit_count')->where('time','egt',strtotime(date('Ymd')))->setInc($data);

        }
    }

    public function isMobile()
    {
        // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
        if (isset ($_SERVER['HTTP_X_WAP_PROFILE']))
            return 'mobile';

        //此条摘自TPM智能切换模板引擎，适合TPM开发c
        if (isset ($_SERVER['HTTP_CLIENT']) && 'PhoneClient' == $_SERVER['HTTP_CLIENT'])
            return 'mobile';
        //如果via信息含有wap则一定是移动设备,部分服务商会屏蔽该信息
        if (isset ($_SERVER['HTTP_VIA']))
            //找不到为flase,否则为true
            return stristr($_SERVER['HTTP_VIA'], 'wap') ? 'mobile' : 'pc';
        //判断手机发送的客户端标志,兼容性有待提高
        if (isset ($_SERVER['HTTP_USER_AGENT'])) {
            $clientkeywords = array(
                'nokia', 'sony', 'ericsson', 'mot', 'samsung', 'htc', 'sgh', 'lg', 'sharp', 'sie-', 'philips', 'panasonic', 'alcatel', 'lenovo', 'iphone', 'ipod', 'blackberry', 'meizu', 'android', 'netfront', 'symbian', 'ucweb', 'windowsce', 'palm', 'operamini', 'operamobi', 'openwave', 'nexusone', 'cldc', 'midp', 'wap', 'mobile'
            );
            //从HTTP_USER_AGENT中查找手机浏览器的关键字
            if (preg_match("/(" . implode('|', $clientkeywords) . ")/i", strtolower($_SERVER['HTTP_USER_AGENT']))) {
                return 'mobile';
            }
        }
        //协议法，因为有可能不准确，放到最后判断
        if (isset ($_SERVER['HTTP_ACCEPT'])) {
            // 如果只支持wml并且不支持html那一定是移动设备
            // 如果支持wml和html但是wml在html之前则是移动设备
            if ((strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') !== false) && (strpos($_SERVER['HTTP_ACCEPT'], 'text/html') === false || (strpos($_SERVER['HTTP_ACCEPT'], 'vnd.wap.wml') < strpos($_SERVER['HTTP_ACCEPT'], 'text/html')))) {
                return 'mobile';
            }
        }
        return 'pc';
    }

    public function getBrowser() {
        $user_OSagent = $_SERVER['HTTP_USER_AGENT'];
        if (strpos($user_OSagent, "Maxthon") && strpos($user_OSagent, "MSIE")) {
            $visitor_browser = "Maxthon(Microsoft IE)";
        } elseif (strpos($user_OSagent, "Maxthon 2.0")) {
            $visitor_browser = "Maxthon 2.0";
        } elseif (strpos($user_OSagent, "Maxthon")) {
            $visitor_browser = "Maxthon";
        } elseif (strpos($user_OSagent, "Edge")) {
            $visitor_browser = "Edge";
        } elseif (strpos($user_OSagent, "Trident")) {
            $visitor_browser = "IE";
        } elseif (strpos($user_OSagent, "MSIE")) {
            $visitor_browser = "IE";
        } elseif (strpos($user_OSagent, "MSIE")) {
            $visitor_browser = "MSIE 较高版本";
        } elseif (strpos($user_OSagent, "NetCaptor")) {
            $visitor_browser = "NetCaptor";
        } elseif (strpos($user_OSagent, "Netscape")) {
            $visitor_browser = "Netscape";
        } elseif (strpos($user_OSagent, "Chrome")) {
            $visitor_browser = "Chrome";
        } elseif (strpos($user_OSagent, "Lynx")) {
            $visitor_browser = "Lynx";
        } elseif (strpos($user_OSagent, "Opera")) {
            $visitor_browser = "Opera";
        } elseif (strpos($user_OSagent, "MicroMessenger")) {
            $visitor_browser = "微信浏览器";
        } elseif (strpos($user_OSagent, "Konqueror")) {
            $visitor_browser = "Konqueror";
        } elseif (strpos($user_OSagent, "Mozilla/5.0")) {
            $visitor_browser = "Mozilla";
        } elseif (strpos($user_OSagent, "Firefox")) {
            $visitor_browser = "Firefox";
        } elseif (strpos($user_OSagent, "U")) {
            $visitor_browser = "Firefox";
        } else {
            $visitor_browser = "其它";
        }
        return $visitor_browser;
    }


}