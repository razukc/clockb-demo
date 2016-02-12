
$( document ).ready(function() {

  // show preloader on AJAX start
  $(document).ajaxStart(function(){
    $("div.preloader").show();
    $("div.errors").hide();
    $("div.success").hide();
  });

  // hide preloader on AJAX stop
  $(document).ajaxStop(function(){
    $("div.preloader").hide();
  });
});
