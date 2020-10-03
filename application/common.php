<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------
// 应用公共文件

use think\Config;

//城市获取
function cityLevel(){

        $list = db('provincial')->select();
        return $list;
}
//图片上传
function uploads($file_name,$range,$type='thumb',$size='')
{
    // 获取表单上传文件 例如上传了001.jpg
    $file = request()->file('images');

    // 移动到框架应用根目录/public/uploads/ 目录下
    if($file){

        $path = iconv("UTF-8", "GBK",  ROOT_PATH ."public/uploads/".$file_name);

        if(!file_exists($path)){
            mkdir ($path,0777,true);
        }
        if($size){
            $info = $file->validate(['size'=>$size,'ext'=>'jpg,png,gif,jpeg'])->move($path);

        }else{
            $info = $file->validate(['ext'=>'jpg,png,gif,jpeg'])->move($path);

        }
        if($info){
            // 成功上传后 获取上传信息

            // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
            $image =  $path.'/'.$info->getSaveName();
            $image = str_replace('/','\\',$image);

            $picurls = changImg($file_name,$image,$type,$range);
            return array($picurls,$image);

        }else{
            // 上传失败获取错误信息

            return array('status'=>0,'msg'=>$file->getError());
//            return json_encode(array('status'=>0,'msg'=>$file->getError()));
        }
    }



}
function timeChange($time)
{
    return \ComputeTime::getTime($time);
}

/*
 * 图片缩剪(thumb,crop)
 */
function changImg($file_name,$image,$type,$range)
{


    $image = str_replace('\\','/',$image);

    $result = '';
    $image = \think\Image::open("$image");

    //缩小
    if($type=='thumb'){
        foreach ($range as $key=>$val){
            $wh = explode(',',$val);

            // 按照原图的比例生成一个最大为150*150的缩略图并保存为thumb.png
            $path_file =$file_name.'/'.date("Ymd").'/'.time().rand(11111,99999).'.png!'.$wh[0].'.jpg';
            $image->thumb($wh[0],$wh[1],\think\Image::THUMB_FIXED)->save(ROOT_PATH.'/public/uploads/'.$path_file);

            if(isset($wh[2])){
                $result .=$path_file."=".$wh[2].'$';
            }else{
                $result =$path_file;
            }

            unset($wh);
        }
    }else{
        foreach ($range as $key=>$val){
            $wh = explode(',',$val);

            // 按照原图的比例生成一个最大为150*150的缩略图并保存为thumb.png
            $path_file =$file_name.'/'.date("Ymd").'/'.time().rand(11111,99999).'.png!'.$wh[0].'.jpg';
            $image->thumb($wh[0],$wh[1],\think\Image::THUMB_CENTER)->save(ROOT_PATH.'/public/uploads/'.$path_file);
            if(isset($wh[2])){
                $result .=$path_file."=".$wh[2].'$';
            }else{
                $result =$path_file;
            }
            $wh =[];
        }
    }

    return $result;

}

function cutImg($str){
    $arr = explode('yl',$str);
    return $arr;
}

/*
 * 数据库图片url分割成数组
 */

function imageUrl($str)
{
    $arr = explode ( '$', $str );

    if(count($arr)==1){
        return $arr;
    }
    $all_arr = array ();

    foreach ( $arr as $v ) {
        if(empty($v)){
            continue;
        }
        $itemarr = explode ( '=', $v );
        if(count($itemarr) != 2){
            continue;
        }
        $all_arr [$itemarr[1]] = $itemarr[0];
    }
    return $all_arr;
}

/*
 * 获取数据库单张照片的url
 */
function splitImage($url,$str)
{
    $result = imageUrl($url);

    return $result[$str];
}


/*
 * 删除图片
 */

function delImageFile($str)
{
//    $str = db('brand')->where('id',1)->value('brand_logo');
    $result =  imageUrl($str);

    foreach ($result as $key=>$val){
        $addr = ROOT_PATH.Config("imageUrl").$val;
        @unlink($addr);
        $addr=[];
    }
}

/*
 * 删除图片
 */

function delImageFiles($str)
{

    $addr = ROOT_PATH.Config("imageUrl").$str;
    @unlink($addr);
}

/*
 * 数据库数据的数量
 *
 */

function listNum($dbname)
{
    return db($dbname)->count();
}

/*
 * 分级栏目列表
 * type: false获取所有字段 true 获取id,pid
 */

function cateTree($dbname,$pid=0,$type=false)
{
    if($type){
        $data = db($dbname)->field('id,pid')->select();
        return array_merge(getChildren($data,$pid),[['id'=>&$pid]]);
    }else{
        $data = db($dbname)->select();
        return getChildren($data,$pid);
    }
}


function getChildren($data,$pid,$level=0)
{
    static $result = array();
    foreach ($data as $key=>$val){
        if($pid == $val['pid']){
            $val['level']     = $level;
            $result[$key]     = $val;
            getChildren($data,$val['id'],$level+1);
        }
    }
    return $result;
}
function getSonMax($db,$id)
{
    $pid = db($db)->where('id',$id)->value('pid');
    $sql = "SELECT MAX(id) as max FROM `tp_$db` WHERE `pid` = $pid";
    $pid = db($db)->query($sql);

    return $pid[0]['max'];
}

function getSon($db,$pid)
{
    $result = db($db)->order('sort asc')->where('status',1)->where('pid',$pid)->select();
    return $result;
}
function getParent($db,$id)
{
    $result = db($db)->where('id',$id)->value('pid');
    return $result;
}
function getField($db,$id,$field)
{
    $result = db($db)->order('sort asc')->where('status',1)->where('id',$id)->value($field);
    return $result;
}
/*
 * 模板获取数据
 */
function getData($dbname,$where='')
{
    return db($dbname)->where($where)->select();
}



//获取id的name
function getFiledName($db,$id,$field){
    $name = db($db)->where('id',$id)->value($field);
    return $name;
}

//获取用户真实ip
function get_real_ip(){
    $ip=false;
    if(!empty($_SERVER['HTTP_CLIENT_IP'])){
        $ip=$_SERVER['HTTP_CLIENT_IP'];
    }
    if(!empty($_SERVER['HTTP_X_FORWARDED_FOR'])){
        $ips=explode (', ', $_SERVER['HTTP_X_FORWARDED_FOR']);
        if($ip){ array_unshift($ips, $ip); $ip=FALSE; }
        for ($i=0; $i < count($ips); $i++){
            if(!preg_match ('/^(10│172.16│192.168)./', $ips[$i])){
                $ip=$ips[$i];
                break;
            }
        }
    }
    return ($ip ? $ip : $_SERVER['REMOTE_ADDR']);
}
function get_cate_name($id)
{
    $cate_name = db('cate')->where('id',$id)->value('cate_name');
    return $cate_name;
}
function get_time($time)
{
   return ComputeTime::getTime($time);
}

/**
 * 获取 IP  地理位置
 * 淘宝IP接口
 * @Return: array
 */
//function getCity($ip = '')
//{
//    if($ip == ''){
//        $url = "http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json";
//        $ip=json_decode(file_get_contents($url),true);
//        $data = $ip;
//    }else{
//        $url="http://ip.taobao.com/service/getIpInfo.php?ip=".$ip;
//        $ip=json_decode(file_get_contents($url));
//        if((string)$ip->code=='1'){
//            return false;
//        }
//        $data = (array)$ip->data;
//    }
//
//    return $data;
//}

//判断字符串里的大写字母 ascii码值:

function  getUpper(){
    $str = request()->controller();

    $arr = preg_split("/[a-z]+/", $str);
//          dump($arr)；
//        [0] => string(1) "A"
//        [1] => string(1) "R"
//        [2] => string(0) ""
    //我需要大第二个换成_r
    $search = '_'.strtolower($arr[1]);
    $str_new = str_replace("$arr[1]","$search",$str);
    return $str_new;
}

//function getBrowser() {
//    $user_OSagent = $_SERVER['HTTP_USER_AGENT'];
//    if (strpos($user_OSagent, "Maxthon") && strpos($user_OSagent, "MSIE")) {
//        $visitor_browser = "Maxthon(Microsoft IE)";
//    } elseif (strpos($user_OSagent, "Maxthon 2.0")) {
//        $visitor_browser = "Maxthon 2.0";
//    } elseif (strpos($user_OSagent, "Maxthon")) {
//        $visitor_browser = "Maxthon";
//    } elseif (strpos($user_OSagent, "Edge")) {
//        $visitor_browser = "Edge";
//    } elseif (strpos($user_OSagent, "Trident")) {
//        $visitor_browser = "IE";
//    } elseif (strpos($user_OSagent, "MSIE")) {
//        $visitor_browser = "IE";
//    } elseif (strpos($user_OSagent, "MSIE")) {
//        $visitor_browser = "MSIE 较高版本";
//    } elseif (strpos($user_OSagent, "NetCaptor")) {
//        $visitor_browser = "NetCaptor";
//    } elseif (strpos($user_OSagent, "Netscape")) {
//        $visitor_browser = "Netscape";
//    } elseif (strpos($user_OSagent, "Chrome")) {
//        $visitor_browser = "Chrome";
//    } elseif (strpos($user_OSagent, "Lynx")) {
//        $visitor_browser = "Lynx";
//    } elseif (strpos($user_OSagent, "Opera")) {
//        $visitor_browser = "Opera";
//    } elseif (strpos($user_OSagent, "MicroMessenger")) {
//        $visitor_browser = "微信浏览器";
//    } elseif (strpos($user_OSagent, "Konqueror")) {
//        $visitor_browser = "Konqueror";
//    } elseif (strpos($user_OSagent, "Mozilla/5.0")) {
//        $visitor_browser = "Mozilla";
//    } elseif (strpos($user_OSagent, "Firefox")) {
//        $visitor_browser = "Firefox";
//    } elseif (strpos($user_OSagent, "U")) {
//        $visitor_browser = "Firefox";
//    } else {
//        $visitor_browser = "其它";
//    }
//    return $visitor_browser;
//}

 function isMobile()
{
    // 如果有HTTP_X_WAP_PROFILE则一定是移动设备
    if (isset ($_SERVER['HTTP_X_WAP_PROFILE']))
        return 'mobile';

    //此条摘自TPM智能切换模板引擎，适合TPM开发
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

function navActive($all,$son)
{

    $y = false;
    if(strstr(strtolower($all),strtolower($son))){
        $y = true;

    }
    return $y;
}



