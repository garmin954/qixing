<?php
/**
 * tpAdmin [a web admin based ThinkPHP5]
 *
 * @author yuan1994 <tianpian0805@gmail.com>
 * @link http://tpadmin.yuan1994.com/
 * @copyright 2016 yuan1994 all rights reserved.
 * @license http://www.apache.org/licenses/LICENSE-2.0
 */

//------------------------
// 根据user-agent获取浏览器版本，操作系统
//-------------------------

class ComputeTime
{
    /**
     * 获取客户端浏览器信息 添加win10 edge浏览器判断
     * @param  null
     * @author  Jea杨
     * @return string
     */
    public static function getTime($time)
    {
        $nt =  time()-$time;
        if($nt <= 60){
            return $nt.'秒前';
        }else if($nt <= 3600 && $nt > 60){
            $nt = floor($nt/60);
            return $nt.'分钟前';
        }else if($nt <= 3600*24 && $nt > 3600){
            $nt = floor($nt/3600);
            return $nt.'小时前';
        }else if($nt <= 3600*24*7 && $nt > 3600*24){
            $nt = floor($nt/(3600*24));
            return $nt.'天前';
        }else if($nt <= 3600*24*30 && $nt > 3600*24*7){
            $nt = floor($nt/(3600*24*7));
            return $nt.'周前';
        }else if($nt <= 3600*24*30*12 && $nt > 3600*24*30){
            $nt = floor($nt/(3600*24*30));
            return $nt.'月前';
        }
        else if($nt > 3600*24*30*12){
            $nt = floor($nt/(3600*24*30*12));
            return $nt.'年前';
        }
    }


}
