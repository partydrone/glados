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

$(document).ready(function(){
  if ( $('.gingerbread').is('is-stuck') ) {
    $('#mercy').addClass('disneyland');
  }
});