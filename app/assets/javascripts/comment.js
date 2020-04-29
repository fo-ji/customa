$(function(){
  function buildHTML(comment){
    var html =
      `<div class="comment__list--all">
        <li class="comment__list--text">
          ${comment.comment}
        </li>
        <li class="comment__list--date">
          ${comment.created_at}
        </li>
      </div>`
    return html;
  }

  $('#document__comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.block__text--wide').append(html);
       $('form')[0].reset();
    })
  });
});
