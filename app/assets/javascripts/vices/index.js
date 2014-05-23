$(document).ready(function() {
    $('.head').click(function(e){
        e.preventDefault();
        console.log(this);
        $(this).closest('li').find('.content').not(':animated').slideToggle();
    });
});