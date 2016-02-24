    $(function(){
      setTimeout(function(){
        $('.readmore').readmore({
          moreLink: '<a href="#" class="button tiny info right clearfix" style="width:auto;margin-top:10px;">Read More</a>',
          lessLink: '<a href="#" class="button tiny info right clearfix" style="width:auto;">Close</a>',
          afterToggle: function(trigger, element, expanded) {
              // if(! expanded) { // The "Close" link was clicked
              //   $('html, body').animate( { scrollTop: element.offset().top }, {duration: 100 } );
              // }
          $(document).foundation('equalizer', 'reflow');
          }
        });  
          $(document).foundation('equalizer', 'reflow');
      }, 1000);
    });
    