(function($){
    'use strict';

    var defaults = {
        topOffset: 320, //px - offset to switch of fixed position
        hideDuration: 300, //ms
        stickyClass: 'is-fixed'
    };

    $.fn.stickyPanel = function(options){
        if(this.length == 0) return this; 

        var self = this,
            settings,
            isFixed = false, //state of panel
            stickyClass,
            animation = {
                normal: self.css('animationDuration'), //show duration
                reverse: '', //hide duration
                getStyle: function (type) {
                    return {
                        animationDirection: type,
                        animationDuration: this[type]
                    };
                }
            };

        function init(){
            settings = $.extend({}, defaults, options);
            animation.reverse = settings.hideDuration + 'ms';
            stickyClass = settings.stickyClass;
            $(window).on('scroll', onScroll).trigger('scroll');
        }

        function onScroll() {
            if ( window.pageYOffset > settings.topOffset){
                if (!isFixed){
                    isFixed = true;
                    self.addClass(stickyClass)
                        .css(animation.getStyle('normal'));
                }
            } else {
                if (isFixed){
                    isFixed = false;

                    self.removeClass(stickyClass)
                        .each(function (index, e) {
                            void e.offsetWidth;
                        })
                        .addClass(stickyClass)
                        .css(animation.getStyle('reverse'));

                    setTimeout(function () {
                        self.removeClass(stickyClass);
                    }, settings.hideDuration);
                }
            }
        }

        init();

        return this;
    }
})(jQuery);


$(function () {
    $('#fixed').stickyPanel();
});