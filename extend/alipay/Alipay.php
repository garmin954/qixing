<?php
/**
 * Created by PhpStorm.
 * User: 15490
 * Date: 2019/2/9
 * Time: 0:11
 */
namespace alipay;


use alipay\pagepay\buildermodel\AlipayTradePagePayContentBuilder;
use alipay\pagepay\service\AlipayTradeService;

class Alipay
{
    private $config = array();

    public function __construct()
    {
        require_once(dirname(__FILE__).'/config.php');
        $this->config = $config;
    }

    public function PagePay($arr)
    {

        //构造参数
        $payRequestBuilder = new AlipayTradePagePayContentBuilder();
        $payRequestBuilder->setBody(trim($arr['WIDbody']));//商品描述，可空
        $payRequestBuilder->setSubject(trim($arr['WIDsubject'])); //订单名称，必填
        $payRequestBuilder->setTotalAmount(trim($arr['WIDtotal_amount']));//付款金额，必填
        $payRequestBuilder->setOutTradeNo(trim($arr['WIDout_trade_no']));//商户订单号，商户网站订单系统中唯一订单号，必填

        $aop = new AlipayTradeService($this->config);

        /**
         * pagePay 电脑网站支付请求
         * @param $builder 业务参数，使用buildmodel中的对象生成。
         * @param $return_url 同步跳转地址，公网可以访问
         * @param $notify_url 异步通知地址，公网可以访问
         * @return $response 支付宝返回的信息
         */
        $response = $aop->pagePay($payRequestBuilder,$this->config['return_url'],$this->config['notify_url']);
    }

    //取消订单
    public function PageClose($arr)
    {

        //构造参数
        $RequestBuilder=new AlipayTradeService();
        $RequestBuilder->setOutTradeNo(trim($arr['WIDTCout_trade_no'])); //商户订单号，商户网站订单系统中唯一订单号
        $RequestBuilder->setTradeNo(trim($arr['WIDTCtrade_no'])); //支付宝交易号
        $aop = new AlipayTradeService($this->config);

        /**
         * alipay.trade.close (统一收单交易关闭接口)
         * @param $builder 业务参数，使用buildmodel中的对象生成。
         * @return $response 支付宝返回的信息
         */
        $response = $aop->Close($RequestBuilder);
        var_dump($response);
    }
}