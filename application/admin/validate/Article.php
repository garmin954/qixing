<?php
namespace app\admin\Validate;

use think\Validate;

class Article extends Validate {

    protected $rule =[
        'title'=>'require',
//        'author'=>'require',
        'cate_id'=>'require',
//        'type'=>'require',
//        'thumb'=>'require',
        'status'=>'require',
//        'thumb_list'=>'require',
        'content'=>'require'
    ];

    protected $message  =[
        'content.require'=>'内容不能为空',
        'title.require'=>'标题不能为空',
        'cate_id.require'=>'所属栏目不能为空',
        'thumb.require'=>'压缩图不能为空',
    ];

    protected $secen =[

    ];
}
