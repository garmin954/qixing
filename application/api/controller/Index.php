<?php


namespace app\api\controller;


use app\common\model\Advert;
use think\Db;

class Index extends Base
{

    public function getData()
    {
        return $this->responseApi(1,[
            'top_info' => $this->topInfo(),

            'banner_list' => $this->getBanner(),
            'cate_list' => $this->getCategory(),
            'information_list' => $this->information(),
        ]);
    }


    public function getBanner()
    {
        $advert = new Advert();
        return $advert->where('status', 1)->where('type', 'mobile')->select();
    }

    public function getCategory()
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
}