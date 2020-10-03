<?php
/**
 * Created by ";Storm.
 * User: 15490
 * Date: 2019/1/21
 * Time: 19:29
 */
namespace app\index\controller;
use \app\index\controller;
use think\Config;
use think\Db;

class Index extends controller\Base
{
    public function index()
    {
        // 获取数据
        $cateId = Config::get('home_category_id');
        $schoolList = db('article')->field('id,thumb,sort_desc,sort_title,title')->where('status', 1)->where('cate_id', $cateId['yxzx'])->order('id desc sort desc')->paginate(12);
        $this->assign('schoolList', $schoolList);

        // 获取数据
        $advisoryList = db('article')->field('id,thumb,desc,add_time,title')->where('status', 1)->where('cate_id', $cateId['lxzx'])->order('id desc sort desc')->paginate(8);
        $this->assign('advisoryList', $advisoryList);

        //热门国家
//        $pids = '1,2,3,4,5,6';
        $country = db('article')->where(['status'=>1,'link'=>['neq', '']])->select();
        $_country = [];
        foreach ($country as $countrys){
            $_country[$countrys['country']] = $countrys;
        }
        $this->assign('country', $_country);

        $tagList = db('tag')->where('status', 1)->select();
        $this->assign('tagList', $tagList);
        
        return view();
    }

    public function getCateArticle()
    {
        $cate = db('cate')->order('sort asc') -> where('pid',0) -> where('status',1)->select();

        $cate_art = [];
        foreach ($cate as $key => $val){

            $cate_art[$key] = $val;
            $cate_art[$key]['article'] = db('article') -> where(['cate_id'=>$val['id'],'status'=>1])->order('id desc')->limit('8')->select();

        }

//        dump($cate_art);

        $this -> assign('cate_article',$cate_art);
    }


    public function article()
    {
        $id = input('id');
        $info = db('article') ->where('id',$id) ->where('status',1)->find();


        $tag_id = explode(',',$info['tag']);

		if(empty($tag_id[0])){
		$where = [
            'status'    => 1,
            'tag'       =>  -1
        ];	}
		else{
        $where = [
            'status'    => 1,
            'tag'       =>  ['in',$tag_id]
        ];}
        $related = db('article')->where($where) ->order('id desc') -> limit('4') ->select();
        $this -> assign([
            'info'      =>  $info,
            'related'    =>$related
        ]);
        return view();
    }

    public function categorys()
    {
        $id = input('id');

        $info = db('cate') -> where(['id'=>$id,'status'=>1]) -> find();

        $list = db('article') -> where(['cate_id'=>$id]) -> order('id desc') -> paginate('12');

        $this -> assign([
            'info'      => $info,
            'list'      => $list,
        ]);
        return view();
    }


    public function lang()
    {

        Lang::setAllowLangList(['zh-cn','zh-hk']);
        switch ($_GET['lang']) {
            case 'cn';
                cookie('think_var', 'zh-cn');
                break;
            case 'hk';
                cookie('think_var', 'zh-hk');
                break;
        }
    }

    public function contact()
    {
        $id = 26;
        $info = db('cate')->where('id', $id)->find();
        $this->assign('info', $info);
        return view('about/contacts');
    }

    public function takeJob()
    {
        $id = input('id', 0);
        $info = db('article')->where('id', $id)->find();
        $this->assign('info', $info);
        return view('about/tackjob');
    }

    public function intro()
    {
        $id = 25;
        $info = db('cate')->where('id', $id)->find();
        $this->assign('info', $info);
        return view('about/intro');
    }
    /**
     * 留言
     * @return \think\response\Json|\think\response\View
     */
    public function message()
    {
        if (request()->isAjax()){
            $data = request()->post();
            $data['add_time']=time();
            if( empty($data['weixin']) || empty($data['name']) || empty($data['mobile'])  ){
                return json(array('status'=>-1,'msg'=>'请填写完整！'));
            }
            if(request()->isPost()){
                $res = Db::table('tp_message')->insert($data);
                if($res){
                    return json(array('status'=>1, 'msg'=>'提交成功！'));
                }else{
                    return json(array('status'=>0, 'msg'=>'提交失败！'));
                }
            }
        }
        $id = 28;
        $info = db('cate')->where('id', $id)->find();
        $this->assign('info', $info);
        return view('about/message');
    }


    /*
     * 顾问团队
     */
    public function teacher()
    {
        // 获取数据
        $cateId = Config::get('home_category_id');
        $childrenCate = db('cate')->where(['pid'=>$cateId['gwtd'], 'status'=>1])->select();

        $cid = request()->param('cid',current($childrenCate)['id']);
        $artList = db('article')->field('id,desc,sort_desc,title,add_time,thumb')->where('status', 1)->where('cate_id', $cid)->order('id desc sort desc')->paginate(10);
        $this->assign('artList', $artList);

        $this->assign([
            'cateName' => db('cate')->where(['id'=>$cid, 'status'=>1])->value('cate_name'),
            'current' => $cid,
            'childrenCate' => $childrenCate
        ]);

        return view();
    }

    /*
     * 顾问团队信息
     */
    public function teacherInfo()
    {
        // 获取数据
        $id = request()->param('id', 0);
        db('article')->where('id', $id)->setInc('look', 1);
        $info = db('article')->where('status', 1)->where('id', $id)->find();
        if (empty($info)){
            abort(404,'页面不存在');
        }
        $this->assign('info', $info);
        return view('tinfo');
    }

    /*
     * 热门活动
     */
    public function hotDoing()
    {
        // 获取数据
        $cateId = Config::get('home_category_id');
        $artList = db('article')->field('id,desc,sort_title,title,add_time')->where('status', 1)->where('cate_id', $cateId['rmhd'])->order('id desc sort desc')->paginate(10);
        $this->assign('artList', $artList);
        return view();
    }


    /*
     * 热门活动信息
     */
    public function hotInfo()
    {
        return view();
    }

    /*
     * 学院列表
     */
    public function collage()
    {
        $tag = request()->param('id', 0);
        $map = [];
        if ($tag != 0){
            $map[]= ['exp',Db::raw("FIND_IN_SET($tag,tag)")];
        }
        // 获取数据
        $cateId = Config::get('home_category_id');
        $artList = db('article')->where($map)->field('id,thumb,sort_desc,sort_title,title')->where('status', 1)->where('cate_id', $cateId['yxzx'])->order('id desc sort desc')->paginate(12);
        $this->assign('artList', $artList);

        $tagList = db('tag')->where('status', 1)->select();
        $this->assign('tagList', $tagList);
        $this->assign('tags', $tag);


        return view();
    }

    /*
     * 学校信息
     */
    public function collageInfo()
    {
        $id = request()->param('id', 0);
        db('article')->where('id', $id)->setInc('look', 1);
        $info = db('article')->where('id', $id)->find();
        if (empty($info)){
            abort(404,'页面不存在');
        }
        $this->assign('info', $info);
        return view();
    }

    /**
     * 查询服务
     * @return \think\response\View
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function serviceSearch()
    {
        $number = request()->param('number', '');
        if (!empty($number)) {
           $serviceList = db('service')->where('number', $number)->select();
            $this->assign([
                'exist' => 1,
                'serviceList' => $serviceList
            ]);
        }else{
            $this->assign('exist', 0);
        }
        return view();
    }

    public function category()
    {
        $v = request()->param('v', '');
        $view = 'ludiye/'.$v;

        return view($view);
    }

    public function advisory()
    {
        // 获取数据
        $cateId = Config::get('home_category_id');
        $artList = db('article')->field('id,desc,sort_title,title,add_time')->where('status', 1)->where('cate_id', $cateId['lxzx'])->order('id desc sort desc')->paginate(10);
        $this->assign('artList', $artList);
        return view();
    }

    public function jobList()
    {
// 获取数据
        $cateId = Config::get('home_category_id');
        $artList = db('article')->field('id,desc,sort_title,title,add_time')->where('status', 1)->where('cate_id', $cateId['zplb'])->order('id desc sort desc')->paginate(12);
        $this->assign('artList', $artList);
        return view();

        return view();
    }


    function tools()
    {
        $res =  db('article')->where('cate_id', 9)->update(['cate_id'=>32]);
        dump($res);
    }
}
