(function(){$(function(){return $(".highlight-wrapper").each(function(){var e;return e='<div class="wrap-button"><a href="#">wrap</a></div>',$(this).before(e)}),$(".wrap-button a").on("click",function(e){var t;return e.preventDefault(),t=$(this).parents(".wrap-button").next(".highlight-wrapper").find("td.code pre"),$(t).toggleClass("wrap")})})}).call(this);