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

class CitySort
{
    /**
     * 取汉字的第一个字的首字母
     * @param type $str
     * @return string|null
     * @user qichao
     * @date 2017-04-13
     */
    public static function _getFirstCharter($str)
    {
        if (empty($str)) {
            return '';
        }
        $fchar = ord($str{0});
        if ($fchar >= ord('A') && $fchar <= ord('z')) return strtoupper($str{0});
        $s1 = iconv('UTF-8', 'gb2312', $str);
        $s2 = iconv('gb2312', 'UTF-8', $s1);
        $s = $s2 == $str ? $s1 : $str;
        $asc = ord($s{0}) * 256 + ord($s{1}) - 65536;

        if ($asc >= -20319 && $asc <= -20284) return 'A';
        if ($asc >= -20283 && $asc <= -19776 || $asc == -9743) return 'B';
        if ($asc >= -19775 && $asc <= -19219) return 'C';
        if ($asc >= -19218 && $asc <= -18711 || $asc == -9767) return 'D';
        if ($asc >= -18710 && $asc <= -18527) return 'E';
        if ($asc >= -18526 && $asc <= -18240) return 'F';
        if ($asc >= -18239 && $asc <= -17923) return 'G';
        if ($asc >= -17922 && $asc <= -17418) return 'H';
        if ($asc >= -17417 && $asc <= -16475) return 'J';
        if ($asc >= -16474 && $asc <= -16213) return 'K';
        if ($asc >= -16212 && $asc <= -15641 || $asc == -7182 || $asc == -6928) return 'L';
        if ($asc >= -15640 && $asc <= -15166) return 'M';
        if ($asc >= -15165 && $asc <= -14923) return 'N';
        if ($asc >= -14922 && $asc <= -14915) return 'O';
        if ($asc >= -14914 && $asc <= -14631 || $asc == -6745) return 'P';
        if ($asc >= -14630 && $asc <= -14150 || $asc == -7703) return 'Q';
        if ($asc >= -14149 && $asc <= -14091) return 'R';
        if ($asc >= -14090 && $asc <= -13319) return 'S';
        if ($asc >= -13318 && $asc <= -12839) return 'T';
        if ($asc >= -12838 && $asc <= -12557) return 'W';
        if ($asc >= -12556 && $asc <= -11848) return 'X';
        if ($asc >= -11847 && $asc <= -11056) return 'Y';
        if ($asc >= -11055 && $asc <= -10247) return 'Z';

        return null;
    }

//调用方法： $this->_getFirstCharter('张家口');

    //然后下一步，要对这个二维数据排序。我思考了很久，后来想到了方案，先在循环里调用这个取首字母的方法，然后以这个字母作为key，因为php里有根据key排序的方法，所以我的代码写成这样就搞定了：

    public static function getRegionlist($type)
    {
        $regionData = self::_regionNamesArray($type);

        $settlesRes = array();
        foreach ($regionData as $key => $sett) {
            $name = $sett['city'];
            $nameFirstChar =  self::_getFirstCharter($name); //取出第一个汉字的首字母

            $settlesRes[$nameFirstChar][] = $sett;//以这个首字母作为key
        }
        ksort($settlesRes);
        return $settlesRes;
    }

    /**
     * 城市名称
     */
    public static function _regionNamesArray($type)
    {
        //获取rid和城市name
        $result = db('city')->select();
        foreach ($result as &$val){
            $val['nums'] = db('w_personal')->where(['status'=>1,'cid'=>$val['id'],'type'=>$type])->count();
        }

        return $result;
    }
}
