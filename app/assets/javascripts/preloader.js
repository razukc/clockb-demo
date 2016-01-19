
$( document ).ready(function() {

  // show preloader on AJAX start
  $(document).ajaxStart(function(){
    $(".preloader").show();
    $(".errors").hide();
  });

  // hide preloader on AJAX stop
  $(document).ajaxStop(function(){
    $(".preloader").hide();
  });

});
