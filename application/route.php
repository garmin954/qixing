<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------

use think\Route;
// 注册路由到index模块的News控制器的read操作
Route::rule('index/:c','index/index/index');

Route::rule('index','index/index/index');


Route::rule('contact','index/index/contact');
Route::rule('message','index/index/message');
Route::rule('/','index/index/index');
Route::rule('article/:id','index/index/article');
Route::rule('article','index/index/article');
Route::rule('category','index/index/category');
Route::rule('index','index/index/index');
Route::rule('index','index/index/index');

Route::rule('teacher','index/index/teacher');
Route::rule('tInfo','index/index/teacherInfo');

Route::rule('hotDoing','index/index/hotDoing');
Route::rule('hInfo','index/index/hotInfo');
Route::rule('collage/:id','index/index/collage');

Route::rule('collage','index/index/collage');

Route::rule('cInfo','index/index/collageInfo');

Route::rule('serviceSearch','index/index/serviceSearch');

Route::rule('intro','index/index/intro');
Route::rule('takeJob','index/index/takeJob');
Route::rule('contact','index/index/contact');
Route::rule('message','index/index/message');
Route::rule('advisory','index/index/advisory');
Route::rule('jobList','index/index/jobList');

