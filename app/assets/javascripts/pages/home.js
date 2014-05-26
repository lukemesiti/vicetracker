$(document).ready(function(){
    $('.carousel').carousel();

    $('#insentives-list-right').hide();

    $('#how').click(function(e) {
        e.preventDefault();
        $('#insentives-list-right').hide();
        $('#insentives-list-left').fadeIn("slow");
        $('#how').addClass("home-insentive-selected");
        $('#why').removeClass("home-insentive-selected");
    });
    
    $('#why').click(function(e) {
        e.preventDefault();
        $('#insentives-list-left').hide();
        $('#insentives-list-right').fadeIn("slow");
        $('#how').removeClass("home-insentive-selected");
        $('#why').addClass("home-insentive-selected");
    });

    $(".why-description").mouseover( function() {
        $(this).prev().addClass('why-number-grow');
    });

    $(".why-description").mouseout( function() {
        $(this).prev().removeClass('why-number-grow');
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