<?php
namespace app\admin\validate;
use think\Validate;


class Login extends Validate {

    protected $rule =[
        'username'=>'require|chsAlphaNum',
        'password'=>'require',
        'check'=>'require'
    ];

    protected $message  =[
        'username.require' => '账号不能为空！',
        'username.chsAlphaNum'=>'警告：不要输入非法字符！',
        'check.require'=>'验证码不能为空！',
        'password.require'=>'密码不能为空！'
    ];

    protected $secen =[

    ];
}