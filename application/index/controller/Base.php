<?php
/**
 * Created by PhpStorm.
 * User: 15490
 * Date: 2019/1/21
 * Time: 19:29
 */

namespace app\index\controller;

use \app\common\controller;
use think\Config;
use think\Lang;

class Base extends controller\Base
{
    protected $config = array();

    public function _initialize()
    {

        $this->getNavList();
        $this->getConfig();
        $base = new controller\Base();
        $base->visitCount();
        $this->get_lang();
        //轮播
        $banner_list = db('advert')->where('status',1)->where('type','banner')->limit('8')->select();
        foreach ($banner_list as &$val)
        {
            $val = str_replace('\\','/',$val);
        }

        $this->assign([
            'banner_list' =>$banner_list,
        ]);
        $this->getAboutUs();
    }

    public function getAboutUs()
    {
        $pid = Config::get('home_category_id')['gywm'];
        $aboutList = db('cate')->where('pid', $pid)->select();
        $this->assign('aboutList', $aboutList);
    }
    /**
     * 多语言
     */
    public function get_lang()
    {

        Lang::setAllowLangList(['zh-cn','en-us']);
        $_GET['lang'] =isset($_GET['lang'])?$_GET['lang']:'hk';
        switch ($_GET['lang']) {
            case 'cn';
                Lang::load(APP_PATH . 'index\lang\zh-cn.php');
                cookie('think_var', 'zh-cn');
                break;
            case 'hk';
                Lang::load(APP_PATH . 'index\lang\zh-hk.php');
                cookie('think_var', 'zh-hk');
                break;
        }
    }

    //获取系统参数
    public function getConfig()
    {
        $config = db('system')->select();
        $result = array();
        foreach ($config as $key => $val) {
            if ($val['status'] == 0) {
                $val['value'] = '';
            }
            $result[$val['ename']] = str_replace('\\', '/', $val['value']);
        }
        $this->config = $result;
//        dump($result);
        $this->assign('config', $result);
//        return $result;
    }


    /**
     * 获取导航
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function getNavList()
    {
        $list = db('cate')->where('status', 1)->order('sort asc')->select();
        $navList = $this->navTree($list, 0);
        $this->assign('navList', $navList);
    }

    public function navTree($data, $pid)
    {
        $arr = [];
        foreach ($data as $nav){
            if ($nav['pid'] == $pid){
                $item = [
                    'pid' => $pid['pid'],
                    'children' => $this->navTree($data, $nav['id']),
                    'cate_name' => $nav['cate_name'],
                    'link' => $nav['link'],
                    'id' => $nav['id'],
                ];
                $arr[] = $item;
            }
        }
        return $arr;
    }
}