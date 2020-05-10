$(function() {

  var quotation_list = $(".quotation__list");
  var minutes_list   = $(".minutes__list");
  var other_list     = $(".other__list");

  function appendDocument(document) {

    if(document.quotation_user_sign_in && document.quotation_user_sign_in.id == document.quotation_user_id){

      var quotation_html = `<ul class="quotation__list">
                              <div class="quotation__list--all">
                                <li class="quotation__list--bookmark">
                                  <a class="bookmark__icon" rel="nofollow" data-method="delete" href="/documents/${document.quotation_id}/add"><i class="fas fa-bookmark fa-2x"></i>
                                  </a>
                                </li>
                                <a href="/documents/${document.quotation_id}">
                                  <div class="quotation__list--nav">
                                    <li class="quotation__list--name">
                                      ${document.quotation_name}
                                    </li>
                                    <li class="quotation__list--date">
                                      作成日：${document.quotation_created_at}
                                    </li>
                                  </div>
                                </a>
                              </div>
                            </ul>`;
      quotation_list.append(quotation_html);
    }

    if(document.minute_user_sign_in && document.minute_user_sign_in.id == document.minute_user_id){

      var minutes_html = `<ul class="minutes__list">
                            <div class="minutes__list--all">
                              <li class="minutes__list--bookmark">
                                <a class="bookmark__icon" rel="nofollow" data-method="delete" href="/documents/${document.minute_id}/add"><i class="fas fa-bookmark fa-2x"></i>
                                </a>
                              </li>
                              <a href="/documents/${document.minute_id}">
                                <div class="minutes__list--nav">
                                  <li class="minutes__list--name">
                                    ${document.minute_name}
                                  </li>
                                  <li class="minutes__list--date">
                                    作成日：${document.minute_created_at}
                                  </li>
                                </div>
                              </a>
                            </div>
                          </ul>`;
      minutes_list.append(minutes_html);
    }
    
    if(document.other_user_sign_in && document.other_user_sign_in.id == document.other_user_id){

      var other_html = `<ul class="other__list">
                          <div class="other__list--all">
                            <li class="other__list--bookmark">
                              <a class="bookmark__icon" rel="nofollow" data-method="delete" href="/documents/${document.other_id}/add"><i class="fas fa-bookmark fa-2x"></i>
                              </a>
                            </li>
                            <a href="/documents/${document.other_id}">
                              <div class="other__list--nav">
                                <li class="other__list--name">
                                  ${document.other_name}
                                </li>
                                <li class="other__list--date">
                                  作成日：${document.other_created_at}
                                </li>
                              </div>
                            </a>
                          </div>
                        </ul>`;
      other_list.append(other_html);
    }
  }

  $(".list__info--name").on("click", function() {

    var clientValue = $(this).data("id");
    
    $.ajax({
      type: 'GET',
      url: '/clients/selected_client',
      data: { client_id: clientValue },
      dataType: 'json',
    })
    
    .done(function(documents) {
      $([quotation_list[0] , minutes_list[0]]).add([other_list[0]]).empty();
      $([quotation_list[0] , minutes_list[0]]).add([other_list[0]]).html(changeList);
      var changeList = documents.forEach(function(document){
        appendDocument(document);
      });
    })

    .fail(function() {
      alert("読み込みに失敗しました");
    })
  });
});
