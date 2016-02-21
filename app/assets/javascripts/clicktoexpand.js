    $(function(){
      setTimeout(function(){
        $('.readmore').readmore({
          moreLink: '<a href="#" class="button tiny secondary right" style="width:auto;">Read More</a>',
          lessLink: '<a href="#" class="button tiny secondary right" style="width:auto;">Close</a>',
          afterToggle: function(trigger, element, expanded) {
              // if(! expanded) { // The "Close" link was clicked
              //   $('html, body').animate( { scrollTop: element.offset().top }, {duration: 100 } );
              // }
          $(document).foundation('equalizer', 'reflow');

          }
        });  

      }, 1000);
      
    });
    