<?php
namespace app\admin\Validate;

use think\Validate;

class Advert extends Validate {

    protected $regex = [
        'zip' => '\d{6}'
    ];

    protected $rule =[
        'title'=>'require',
       // 'link'=>'require',
        'cate_id'=>'require',
//        'type'=>'require',
        'thumb'=>'require',
        'status'=>'require',
//        'thumb_list'=>'require',

    ];

    protected $message  =[
        'link.require'=>'链接不能为空',
        'link.url'=>'链接格式不正确',
        'title.require'=>'标题不能为空',
        'cate_id.require'=>'所属栏目不能为空',
        'thumb.require'=>'主图不能为空',
    ];

    protected $secen =[

    ];
}