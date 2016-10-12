// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require owl.carousel
//= require foundation
//= require_tree .

$(function() {
  $(document).foundation();

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
