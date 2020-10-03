


<?php
  
        $openId= 'yPph1uWul';
        $appKey= '7660968392720387';
        $dateTime= date("Y-m-d H:i:s");
        $clientVersion= '3.3.0';
        $payType= '1';
        $channel= 'xiaomi';
        $uuid= '1';
//        $userId = $_POST['userId'];
//        $price = $_POST['price']*100;
//        $subject = $_POST['subject'];
//        $body = $_POST['body'];
//        $orderId = $_POST['orderId'];
//        $backPara = $_POST['backPara'];
        $userId = time();
        $price = 1*100;
        $subject = "商品支付";
        $body = "商品支付";
        $orderId = time();
        $backPara = "la";
        $token = "8af2f7418f2943489ee5bf4e045cf561";



$para =  "appKey=$appKey&backPara=$backPara&body=$body&channel=$channel&clientVersion=$clientVersion&dateTime=$dateTime&openId=$openId&orderId=$orderId&payType=$payType&price=$price&subject=$subject&userId=$userId&uuid=$uuid";

//paraToken = (para + token)
$paraToken = $para.$token;
$sign1 = md5($paraToken);

//$data = $_POST;
$args = $para."&sign=".$sign1;
var_dump($args);


?>
<form id="form" action="http://www.payelves.com/api/v1/pay/wap" method="post">
     <input type="hidden" name="openId" value="<?php   echo $openId;?>" />
     <input type="hidden" name="appKey" value="<?php   echo $appKey;?>" />
     <input type="hidden" name="sign" id='sign' value="<?php   echo $sign1;?>" />
     <input type="hidden" name="dateTime" value="<?php   echo $dateTime;?>" />
     <input type="hidden" name="clientVersion" value="<?php   echo $clientVersion;?>" />
     <input type="hidden" name="channel" value="<?php   echo $channel;?>" />
     <input type="hidden" name="userId" value="<?php   echo $userId;?>" />
     <input type="hidden" name="price" value="<?php   echo $price;?>" />
     <input type="hidden" name="payType" id='payType' value="<?php   echo $payType;?>" />
     <input type="hidden" name="subject" value="<?php   echo $subject;?>" />
     <input type="hidden" name="body" value="<?php   echo $body;?>" />
      <input type="hidden" name="orderId" value="<?php   echo $orderId;?>" />
     <input type="hidden" name="backPara" value="<?php   echo $backPara;?>" />
     <input type="hidden" name="uuid" value="<?php   echo $uuid;?>" />


</form>

<script>
    window.onload = function(){
        document.getElementById("form").submit();
    }
</script>
