$(function() {

  var search_list = $(".contents.row");

  function appendDocument(document) {

    if(document.user_sign_in && document.user_sign_in.id == document.user_id){

      var html = `<div class="content_post">
                    <div class="more">
                      <ul class="more_list">
                        <li>
                          <a href="/documents/${document.id}" data-method="get" >
                            <p>${document.name}</p>
                            <p>${document.category}</p><br>
                          </a>
                        </li>
                      </ul>
                    </div>
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
