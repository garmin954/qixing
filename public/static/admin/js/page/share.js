//定义公共的方法
define([],function() {

    var shareService = {};

    shareService.getCountDownTime = function(ms) {
      var $__6,
          $__7;
      var $__5 = [parseInt(ms / 1000 / 60 / 60 % 24, 10), parseInt(ms / 1000 / 60 % 60, 10), parseInt(ms / 1000 % 60, 10)],
          hours = ($__6 = $__5[Symbol.iterator](), ($__7 = $__6.next()).done ? void 0 : $__7.value),
          minutes = ($__7 = $__6.next()).done ? void 0 : $__7.value,
          seconds = ($__7 = $__6.next()).done ? void 0 : $__7.value;
      var checkTime = function(i) {
        return i < 10 ? i = '0' + i : i;
      };
      hours = checkTime(hours);
      minutes = checkTime(minutes);
      seconds = checkTime(seconds);
      return [hours, minutes, seconds];
    }


    return shareService;
});
