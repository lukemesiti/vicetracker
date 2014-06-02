$(document).ready(function(){
    $('.carousel').carousel({
        interval: false
    });

    $(".money-description").mouseover(function() {
      $(this).prev().addClass('money');
    })

    $(".money-description").mouseout(function() {
      $(this).prev().removeClass('money');
    })

    $(".health-description").mouseover(function() {
      $(this).prev().addClass('health');
    })

    $(".health-description").mouseout(function() {
      $(this).prev().removeClass('health');
    })

    $(".track-description").mouseover(function() {
      $(this).prev().addClass('track');
    })

    $(".track-description").mouseout(function() {
      $(this).prev().removeClass('track');
    })

});