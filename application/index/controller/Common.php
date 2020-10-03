<?php
/**
 * Created by PhpStorm.
 * User: 15490
 * Date: 2019/1/21
 * Time: 19:29
 */
namespace app\index\controller;
use \app\index\controller;

class Common extends controller\Base
{
    public function index()
    {
        $id = request()->param('id')?request()->param('id'):2;
        $this->getBanner();
        $this->grtArticle();
        $info = db('cate')->where('id',$id)->find();

        $result = $this->getTopId($info);
//        dump($result);
        $this->assign([
            'cate_num' =>$result['info']['id'],
            'result' => $result
        ]);

        return view();
    }

    //获取顶级id
    public function getTopId($info,$level=10)
    {
        $result = array();
        $result['info']  = $info;
        $result['level'] = 0;
        $result['cates'] = array($info['id']);
        for ($i =0;$i<$level;$i++){
            if($info['pid'] !== 0){
                $info = db('cate')->field('id,cate_name,pid')->where('id',$info['pid'])->find();
                $result['info'] = $info;
                $result['level']++;
                array_unshift( $result['cates'],$info['id']);
            }else{
               return $result;
            }
        }
    }

    //文章
    public function grtArticle()
    {
        $cate_id = $this ->getCateId();
        $art_list = db('article')->order('id desc')->where(['status'=>1])->where('cate_id','in',$cate_id)->paginate(24);
//        dump($art_list);
        $this->assign('art_list',$art_list);
    }

    public function getCateId()
    {
        $id = request()->param('id')?request()->param('id'):'';
        $cates = cateTree('cate',$id);
        $c = array($id);
        foreach ($cates as $val){ $c[] = $val['id']; }
        $cs = implode(',',$c);
        $this->assign('id',$id);

        return $cs;
    }

    //栏目
    public function getCate()
    {

    }

    //轮播
    public function getBanner()
    {
        $banner_list = db('advert')->where(['status'=>1,'type'=>'banner'])->select();
        foreach ($banner_list as &$val){
            $val['thumb'] = str_replace('\\','/',$val['thumb']);
        }
        $this->assign('banner_list',$banner_list);
    }



    public function info()
    {
        $id = input('id');

        db('article')->where('id',$id)->setInc('look',1);
        $info = db('article')->where('status',1)->where('id',$id)->find();
        $cate_info = db('cate')->where('status',1)->where('id',$info['cate_id'])->find();

        //相关文章
        $as_art = db('article')->order('id desc')->where('status',1)->where('cate_id',$info['cate_id'])->limit(10)->select();
        $this->assign([
            'info'=>$info,
            'as_art'=>$as_art,
        ]);
        $result = $this->getTopId($cate_info);
//        dump($result);
        $this->assign([
            'cate_num' =>$result['info']['id'],
            'result' => $result,
            'info'=>$info
        ]);

        return view();
    }




}