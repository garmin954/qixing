<?php
 
 return [

 	'view_replace_str' =>	[
 		'STATIC'	=>	'/public/static/index',
        'VENDOR'	=>	'/public/static/vendor',
        'LUDIYE'	=>	'/public/static/ludiye',

        'PUBLIC'	=>	'/public/',
 	],
     'http_exception_template'=>[
         404 =>APP_PATH.'404.html',
         401 =>APP_PATH.'401.html',
     ],

 ];