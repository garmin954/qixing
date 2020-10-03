<?php
$config = array (
		//签名方式,默认为RSA2(RSA2048)
		'sign_type' => "RSA2",

		//支付宝公钥
		'alipay_public_key' => "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3Om+ku3AdtqKHyu1184UR+8ryJwPhBm9/BzjPH7vyR0t+0+/Lm9jqEy9k8OTfd+y8w6tdlxMmvtIMVIuxqJ6jyP6tPC9F7rXEDSt829pgkkLOUzPn9K46mHJe6HfpKL2Erna+nEwfvUMR67zPoxLG+H+cp/G9H4teIat558ABq27/Rt9GJZWhfq8z+Gm35xXxzzoAdgAiqN/wm4HLSDGYNut9tFhT00AULgFc58u9AktGGrej077w8bwZawPJLbR9vC8br7FqCRWCTF6KARvyvqElnjDZWDGMwMaliBJhhdY2JhAHNfG/1JXjunJBgNfx/vQlNzFsq0QxpZJKeKNgQIDAQAB",

		//商户私钥
		'merchant_private_key' => "MIIEpAIBAAKCAQEA99/Sqp2O7AY3W2P41JTF4MGb5zhGcQp/QgNWag2fwd6iFepLm3S6PpCTq0ytROluTl7DisryOdhLwGz/ZcE0nLLt+GmpkEAK6/I6K4gcuJQ4Sjy02cQwXgfFBtr8bcnfM6aRfsjml+6yoiXmPEwRLWTFcuu8PaY7x24f4i2UForInElQ6n/bALUi+WUgY+DDdWHLmxJz2cpAROC99fR3qhAx5t5azkkcLY27/Q1FL2pK1IRO7cabxsWPWKxjLeoJ494SdLxdf8u1myIlQK6/ZjrWB9D1LnHIteS3+yHTTHdE4Ks1VDrXHl6lpm2aCpHXwLCH9bQdsX/kRrYLp3RAAwIDAQABAoIBAQC5qiRA+e1w6yMRyGs8yAcD1+FwKt3QlD1H8/oJTBUrARjFc46YbbGHZYHGoJN0d6jQ+PhdALC5FUOAaeRPko1XBktrc7G3w9CqdPCPZM+mjhcvvBL2vpZACG/TN7o2fiw6ovx+S/s1OG0DOYIgDhYbu0yOTPbd8qL6OYmWP++ZhXdh06xvk27cwuIsi/jjX3ZZaAFu+epTb9V0oi3YcAPH3G4IGZl5h3EndTXeVEtem7xUwx2p2WB8tLoBQyO4uVqFueVg0eSQOPikzBRgmtInnAW3Gxl3QHHJzUiTj1Il7IX/FoFwQB+W6UExMwUi6yvW+LscmMHD5DLdK8MSuyWpAoGBAP8Cb56TdJboUpE1ty111OMyVCfxSvXtlL3hkUm2LFDvCdQRxipTsV5vZuOA+3e2jpWpRwEkO1dMhY7HZ0P7V34segc5uMs4O5kUiTLCkk/S8dURCtK1HACnRa9oiEfoogk5R5frsGFTHIU6paeXIvulA6LZAAD7uXoGnDH91QpPAoGBAPjWSsnDuxqKfa6/SE+qrqNfP8BR34QRwZ3WXFvYSQtmOO07cO4p/r1LeLrq+0/Twrpi9FKbK/9vfC9d+W5iEgfisbHnanIw4UoB1GsbcSEE72R16sRl/45gszQFEJLV8x2Qs4BAofMMT64QUacwJwoym6itxTiCCCbQJZ0ydSYNAoGAXISkvHKhDRMSya4kXDDw4NDkqW0olhrxKQbKcGTQpThkZ3VfYQHmSu299XJZSbCJAJFeunJLuTuBBTEhLQ/mSVeXmkF94vTu4nYJ5MmkzaMpq/S36YRduXr2lFInh3dGOnR2ng6bemPt6ARED46M2aGftRhnoPOy8iutxZFjFo8CgYByyafGW1w8ahaAPg0Fcx8MjivCdAI/0lEWloQUejl34Lfx97GorAavG9mdoDg+Itl5UZyTXrF1K+CFmTwvB1559MEz6CTaeGH02dM7dXVCXhxwo1ShNMwmycThAlUa50c3JEEpsKcEj3FSQoToMvZPZfkYXtDTuGg6P1qaoWQZIQKBgQDpXA4MsO+I3ofh62bq3UFesELWWX6Je2Q1OrJ0r4TbcSfYtGAzi3vbCe/H3Wp6PL3lyb+Qsu6jTEdVJFSHuO1MmJ2FD/Bsj144A8aowZeXmSDYksEUsecjNRb+OiBuznqYzKsN2A2cYUda6wo/vFCBWxMCHm3GR6qaIbBlvuyZCQ==",

		//编码格式
		'charset' => "UTF-8",

		//支付宝网关
		'gatewayUrl' => "https://openapi.alipaydev.com/gateway.do",

		//应用ID
		'app_id' => "2016091300503814",

		//异步通知地址,只有扫码支付预下单可用
		'notify_url' => "http://www.baidu.com",

		//最大查询重试次数
		'MaxQueryRetry' => "10",

		//查询间隔
		'QueryDuration' => "3"
);