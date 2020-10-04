<?php


namespace app\api\controller;


use think\Controller;

class Base extends Controller
{

    public function __construct()
    {

    }

    public function responseApi($type=1, $data=[], $msg='操作成功！')
    {
        $code = 200;
        if ($type == 0){
            $msg = '操作失败！';
            $code = 0;
        }

        return json(compact('code','msg', 'data'));
    }

}