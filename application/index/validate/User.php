<?php
/**
 * Created by PhpStorm.
 * User: 15490
 * Date: 2019/1/31
 * Time: 20:03
 */

namespace app\index\validate;


use think\Validate;

class User extends Validate
{
    protected $regex = [

        'register' => '/^[a-zA-z0-9_?!.@]*$/',
        'mobile'    => '/^1(3|4|5|7|8)\d{9}$/',
    ];

    protected $rule =[
        'username'      => 'require|length:3,50|chsDash|unique:user',
        'password'      => 'require|length:1,20|register',
        'repassword'    => 'require|confirm:password',
        'email'         => 'require|email|unique:user',
        'pid'           => 'require',
//        'cid'           => 'require',
        'title'         => 'require|length:3,35',
        'weixin'        => 'require',
        'thumb'         => 'require',
        'thumb2'        => 'require',
        'thumb3'        => 'require',
        'keyboard'      => 'require',
        'smalltext'     => 'require|min:10',
        'contact'       => 'require',
        'mobile'        => 'require|mobile',
        'qq'            => 'number',
        'maidian'       => 'require',
    ];

    protected $message = [
        'username.require' => '账号不能为空！',
        'username.chsDash' => '账号含有非法字符！',
        'username.length'  => '账号长度为3到50个字符！',
        'username.unique'  => '此账号已注册！',
        'password.require' => '密码不能为空！',
        'password.register' => '密码含有非法字符！',
        'password.length'  => '密码长度为6到20个字符！',
        'password.unique'  => '此账号已注册！',
        'repassword.require' => '确认密码不能为空！',
        'repassword.confirm' => '两次密码不同！',
        'email.require'    => '邮箱不能为空！',
        'email.email'      => '邮箱格式不正确！',
        'email.unique'     => '此邮箱已注册！',
        'pid.require'      => '行业不能为空！',
        'title.require'    => '名称不能为空！',
        'title.length'     => '名称字符要求3到15个！',
        'weixin.require'    => '微信号不能为空！',
        'thumb.require'    => '请上传图片！',
        'thumb2.require'    => '请上传图片！',
        'thumb3.require'    => '请上传图片！',
        'keyboard.require'    => '标签不能为空！',
        'smalltext.require'    => '介绍不能为空！',
        'smalltext.min'    => '介绍最少10个字符！',
        'contact.require'    => '联系人不能为空！',
        'mobile.require'    => '手机不能为空！',
        'mobile.mobile'    => '手机号格式不正确！',
        'qq.number'         => 'qq账号格式不正确！',
        'maidian.require'  => '买点不能为空'




    ];

    protected $scene = [

        'register'  => 'username,password,repassword,email',
        'w_group'   => 'pid,title,weixin,thumb,thumb2,thumb3,keyboard,smalltext,contact,mobile,qq',
        'w_personal' => 'pid,title,weixin,thumb,thumb2,keyboard,smalltext,contact,mobile,qq',
        'w_openid' => 'pid,title,weixin,thumb,thumb2,keyboard,smalltext,contact,mobile,qq',
        'w_product' => 'pid,title,weixin,thumb,thumb2,,maidian,smalltext,contact,mobile,qq',


    ];
}