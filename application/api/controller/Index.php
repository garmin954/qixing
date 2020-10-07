<?php


namespace app\api\controller;


use app\common\model\Advert;
use think\Cache;
use think\Db;

class Index extends Base
{

    public function getData()
    {

        $data = Cache::get('mobile_index_data');
        if (empty($data)){
            $data = [
                'top_info' => $this->topInfo(),
                'banner_list' => $this->getBanner(),
                'cate_list' => $this->getCategory(),
                'information_list' => $this->information(),
                'teamwork_list' => $this->getTeamwork(),
                'concat_list' => $this->getConcat(),

            ];

            Cache::set('mobile_index_data', $data, 5*60);
        }


        return $this->responseApi(1,$data);
    }


    public function getBanner()
    {
        $advert = new Advert();
        return $advert->where('status', 1)->where('type', 'mobile')->select();
    }

    public function getTeamwork()
    {
        $advert = new Advert();
        return $advert->where('status', 1)->where('type', 'teamwork')->select();
    }

    public function getConcat()
    {
        $advert = new Advert();
        return $advert->where('status', 1)->where('type', 'concat')->select();
    }


    public function getCategory()
    {
        $data = Cache::get('tag_article');
        if (empty($data)){
            $data =[];
            $tag_list = db('tag')->where(['status'=> 1])->order('sort asc')->select();
            foreach ($tag_list as $value){
                $map = [];
                $map[]= ['exp',Db::raw("FIND_IN_SET({$value['id']},tag)")];
                $children =  db('article')->order('sort asc')->limit(0, 3)
                    ->where(['cate_id'=>config('home_category_id.yxzx'),'status'=> 1])->where($map)
                    ->field('id,title as cate_name,thumb')->select();

                if ($children){
                    $data[] = [
                        'cate_name' =>$value['title'],
                        'id' => $value['id'],
                        'thumb' =>  $value['thumb'],
                        'children' => $children,
                    ];
                }

            }
            Cache::set('tag_article', $data, 8*60);
        }

        return $data;
    }
    public function getRealCategory()
    {
        $list = db('cate')->where(['status'=> 1, 'type'=>0])->order('sort asc')->select();

        return $this->navTree($list, 0);;
    }

    public function topInfo()
    {
        return db('article')->field('title,thumb,add_time')->where(['top'=> 1, 'cate_id'=> 32,'status'=> 1])->order('id desc')->limit(0, 2)->select();
    }

    public function information()
    {
        return db('article')->field('title,thumb,add_time,tags')->where(['cate_id'=> 32,'status'=> 1])->order('id desc')->limit(0, 6)->select();
    }

    public function navTree($data, $pid)
    {
        $arr = [];
        foreach ($data as $nav){
            if ($nav['pid'] == $pid){
                $item = [
                    'pid' => $pid['pid'],
                    'cate_name' => $nav['cate_name'],
                    'link' => $nav['link'],
                    'thumb' => $nav['thumb'],
                    'id' => $nav['id'],
                    'children' => $this->navTree($data, $nav['id']),
                ];
                $arr[] = $item;
            }
        }
        return $arr;
    }


    //获取系统参数
    public function getConfig()
    {
        $data = Cache::get('system_config');
        if (empty($data)){
            $config = db('system')->where('type_id', 4)->select();
            $result = array();
            foreach ($config as $key => $val) {
                if ($val['status'] == 0) {
                    $val['value'] = '';
                }
                $result[$val['ename']] = str_replace('\\', '/', $val['value']);
            }
            $data = $result;
            Cache::get('system_config', $result, 5*60);
        }

        return $this->responseApi(1,$data);
    }


    public function getCountry()
    {
        $country = db('tag')->where('status', 1)->select();
        $type = config('include');

        return $this->responseApi(1, compact('country', 'type'));
    }

    public function getUniversity()
    {
        $country = request()->param('country', '');
        $type = request()->param('type', '');
        $condition = $map = [];
        if ($country){
            $map[]= ['exp',Db::raw("FIND_IN_SET({$country},tag)")];
        }

        if ($type !== ''){
            $map[]= ['exp',Db::raw("FIND_IN_SET({$type},include)")];
        }

        $university_list = db('article')->where(['status'=> 1,'cate_id'=>config('home_category_id.yxzx')])
            ->where($map)
            ->where($condition)->select();

        return $this->responseApi(1, compact('university_list'));
    }
}