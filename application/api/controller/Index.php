<?php


namespace app\api\controller;


use app\common\model\Advert;

class Index extends Base
{

    public function getData()
    {
        return $this->responseApi(1,[
            'banner_list' => $this->getBanner(),
            'cate_list' => $this->getCategory(),
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


    public function information()
    {
        
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