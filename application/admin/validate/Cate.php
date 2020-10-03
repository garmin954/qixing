<?php
namespace app\admin\Validate;

use think\Validate;

class Cate extends Validate {

    protected $rule =[
        'cate_name'=>'require',
        'type'=>'require',
//        'link'=>'url',
        'status'=>'require',
//        'cate_desc'=>'require',
//        'cate_seo'=>'require',
        'content'=>'require',
        'cate_name'=>'require'
    ];

    protected $message  =[
        'link.url'=>'外连接不是有效链接',
    ];

    protected $secen =[

    ];
}