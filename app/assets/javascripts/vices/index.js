function accordion() {
    $('.head').click(function(e){
        e.preventDefault();
        $(this).closest('li').find('.content').not(':animated').slideToggle();
    });
}

function showInfo() {
    $(this).closest('li').find('.content').not(':animated').slideToggle();

}

$(document).ready(accordion);

$(document).ready( function(){

    $('.marker').hover(function() {
        $(this).css('cursor', 'pointer');
    });

    $('.marker').click(showInfo);
});
