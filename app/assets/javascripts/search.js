$(function() {

  var search_list = $(".search__content");

  function appendDocument(document) {

    if(document.user_sign_in && document.user_sign_in.id == document.user_id){

      var html = `<div class="search__document">
                    <a href="/documents/${document.id}">
                      <div class="search__document--name">
                        ${document.name}
                      </div>
                      <div class="search__document--category">
                        ${document.category}
                      </div>
                      <div class="search__document--date">
                        ${document.date}
                      </div>
                      <div class="search__document--file">
                        <img src＝"${document.file}" width="50" height="50">
                      </div>
                    </a>
                  </div>`
      search_list.append(html);
   }}

   function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }

  $(".search-input").on("keyup", function() {
    var input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/documents/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(documents) {
      search_list.empty();
      if (documents.length !== 0) {
        documents.forEach(function(document){
          appendDocument(document);
        });
      }
      else {
        appendErrMsgToHTML("一致するファイルがありません");
      }
    })
  });
});
