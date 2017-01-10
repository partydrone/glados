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

// function detect(){
//   // Opera 8.0+
//   var isOpera = (!!window.opr && !!opr.addons) || !!window.opera || navigator.userAgent.indexOf(' OPR/') >= 0;
//   // Firefox 1.0+
//   var isFirefox = typeof InstallTrigger !== 'undefined';
//   // Safari 3.0+ "[object HTMLElementConstructor]" 
//   var isSafari = Object.prototype.toString.call(window.HTMLElement).indexOf('Constructor') > 0 || (function (p) { return p.toString() === "[object SafariRemoteNotification]"; })(!window['safari'] || safari.pushNotification);
//   // Internet Explorer 6-11
//   var isIE = /*@cc_on!@*/false || !!document.documentMode;
//   // Edge 20+
//   var isEdge = !isIE && !!window.StyleMedia;
//   // Chrome 1+
//   var isChrome = !!window.chrome && !!window.chrome.webstore;
//   // Blink engine detection
//   var isBlink = (isChrome || isOpera) && !!window.CSS;

//   let m = document.getElementById('HideForIeAndEdge');
//   if(isEdge){
//     m.innerHTML = "You're using Edge";
//     m.style.border = '2px solid red'; 
//   } else if(isChrome){
//     m.innerHTML = "You're using Chrome";
//     m.style.display = 'none'; 
//   } else if(isIE){
//     m.innerHTML = "You're using IE";
//     m.style.border = '2px solid red'; 
//   } else {
//     something?
//   }
// }

document.addEventListener("DOMContentLoaded", function(event) {
  detect();
});