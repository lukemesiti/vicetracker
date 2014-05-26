function accordion() {
    $('.head').click(function(e){
        e.preventDefault();
        $(this).closest('li').find('.content').not(':animated').slideToggle();
    });
}

function showInfo() {
    $('.marker').click(function(){
        $(this).closest('li').find('.content').not(':animated').slideToggle();
    });
}

$(document).ready(accordion);

$('.marker').hover(function() {
    $(this).css('cursor', 'pointer');
});

$(document).on('click', '.marker', showInfo)