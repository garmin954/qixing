$(document).ready(function(){
    $.fn.smartFloat = function() {
    var position = function(element) {
        var top = element.position().top, pos = element.css("position");
        $(window).scroll(function() {
            var scrolls = $(this).scrollTop();
            if (scrolls > top) {
                if (window.XMLHttpRequest) {
                    element.css({
                        position: "fixed",
                        top: 0
                    });    
                    $("body").addClass('pri')
                } else {
                    element.css({
                        top: scrolls
                    });    
                    
                }
            }else {
                $("body").removeClass('pri')
                element.css({
                    position: "absolute",
                    top: top
                });    
            }
        });
    };
    return $(this).each(function() {
        position($(this));                         
    });
};

//绑定

$(".menu_type_6,.menu_type_1,.menu_type_2,.menu_type_3,.menu_type_4,.menu_type_5").css("margin",'auto')
$(".menu_type_6,.menu_type_1,.menu_type_2,.menu_type_3,.menu_type_4,.menu_type_5,.menu_type_7,.menu_type_8").smartFloat();


$(".menu_type_6,.menu_type_1,.menu_type_2,.menu_type_3,.menu_type_4,.menu_type_5,.menu_type_7,.menu_type_8").find('a').click(function(){
    $(this).siblings("a").removeClass('current')
    $(this).addClass('current')
})


})