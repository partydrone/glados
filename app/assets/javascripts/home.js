jQuery(function() {
  var storiesContainer = $(".home-stories-container");
  var storiesTwoContainer = $(".two-home-stories-container");

  if (storiesContainer.length > 0) {
    if ($().owlCarousel) {
      storiesContainer.each(function(){
        var carousel= $(this).find('.owl-carousel'),
        navigationNext = $(this).find('.home-story-right'),
        navigationPrev = $(this).find('.home-story-left'),
        nextBtn = navigationNext.find('.owl-next'),
        prevBtn = navigationPrev.find('.owl-prev');

        carousel.owlCarousel({
          autoPlay: false,
          items : 3,
          dots: false,
          scrollPerPage: true,
          itemsDesktop : [1024,3],
          itemsDesktopSmall : [1023,2],
          itemsTablet: [640,1],
          itesmMobile: false
        });

        nextBtn.click(function(){
          carousel.trigger('owl.next');
        });

        prevBtn.click(function(){
          carousel.trigger('owl.prev');
        });
      });
    };
  };

  if (storiesTwoContainer.length > 0) {
    if ($().owlCarousel) {
      storiesTwoContainer.each(function(){
        var carousel= $(this).find('.owl-carousel'),
        navigationNext = $(this).find('.home-story-right'),
        navigationPrev = $(this).find('.home-story-left'),
        nextBtn = navigationNext.find('.owl-next'),
        prevBtn = navigationPrev.find('.owl-prev');

        carousel.owlCarousel({
          autoPlay: false,
          items : 2,
          dots: false,
          scrollPerPage: true,
          itemsDesktop : [1024,2],
          itemsDesktopSmall : [1023,1],
          itemsTablet: [640,1],
          itesmMobile: false
        });

        nextBtn.click(function(){
          carousel.trigger('owl.next');
        });
        prevBtn.click(function(){
          carousel.trigger('owl.prev');
        });
      });
    };
  };
});

function detect(){
  var isOpera = (!!window.opr && !!opr.addons) || !!window.opera || navigator.userAgent.indexOf(' OPR/') >= 0;
  var isFirefox = typeof InstallTrigger !== 'undefined';
  var isSafari = Object.prototype.toString.call(window.HTMLElement).indexOf('Constructor') > 0 || (function (p) { return p.toString() === "[object SafariRemoteNotification]"; })(!window['safari'] || safari.pushNotification);
  var isIE = /*@cc_on!@*/false || !!document.documentMode;
  var isEdge = !isIE && !!window.StyleMedia;
  var isChrome = !!window.chrome && !!window.chrome.webstore;
  // Blink engine detection
  var isBlink = (isChrome || isOpera) && !!window.CSS;

  var m = document.getElementById('ReliableMagellan');
  var h = document.getElementById('CostEffectiveLoops');
  var k = document.getElementById('ReliableTabs');
  if(isEdge){
    m.className += ' always-hide-for-ie';
    h.className += ' always-hide-for-ie';
  // } else if(isChrome){
  //keep for testing
    // m.className += ' reliable-magellan-display';
    // k.className += ' reliable-tabs-display';
    // h.className += ' cost-loops-display';
  } else if(isIE){
    m.className += ' always-hide-for-ie';
    h.className += ' always-hide-for-ie';
  } else {
    m.className += ' reliable-magellan-display';
    k.className += ' reliable-tabs-display';
    h.className += ' cost-loops-display';
  }
}

document.addEventListener("DOMContentLoaded", function(event) {
  detect();
});
