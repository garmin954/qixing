
<?php
return [

    'view_replace_str' => [
    'STATIC' => '/public/static',
    '__PUBLIC__' => '/public/',
    'VENDOR' => '/public/static/vendor',
    ],
    'http_exception_template' => [
    404 => APP_PATH . '404.html',
    401 => APP_PATH . '401.html',
    ],
    'u_editor' => ROOT_PATH . 'ueditor',
    'uploads' => ROOT_PATH . 'public/uploads',

    'ueditor' => '/ueditor',
    'include' => [
        1=> '硕士',
        2=> '本科',
        3=> '副学士',
    ],
];
