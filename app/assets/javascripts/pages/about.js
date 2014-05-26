$(document).ready(function(){
    $('.one').hide();
    $('.two').hide();
    $('.three').hide();

    $('.smokes').hover( function() {
        $('.one').fadeIn('slow');
    });

    $('.beer').hover( function() {
        $('.two').fadeIn('slow');
    });

    $('.food').hover( function() {
        $('.three').fadeIn('slow');
    });   
});
     
