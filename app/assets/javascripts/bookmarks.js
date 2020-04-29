$(function() {

  var bookmark_icon;

  bookmark_icon = function() {
    return $("#bookmark-link").click(function() {
      return $(this).children('i').toggleClass('fa-bookmark-o');
    });
  };

  $(document).on('page:change', bookmark_icon);
});
