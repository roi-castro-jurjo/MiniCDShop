$(function(){
    $("#header").load("header.jsp", function(){
        $(this).css('opacity',0).stop().animate({"opacity": 1}); });
});