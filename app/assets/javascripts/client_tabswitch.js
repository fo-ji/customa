$(function() {

  function buildHTML(quotation) {

    for (i in quotation) {
      console.log(quotation.name);

      var quotation_html = `<ul class="quotation__list">
                    <a href="/quotations/${quotation[i].id}">
                      <div class="quotation__list--all">
                        <li class="quotation__list--name">
                          ${quotation[i].name}
                        </li>
                        <li class="quotation__list--date">
                          ${quotation[i].created_at}
                        </li>
                      </div>
                    </a>
                  </ul>`;
      return quotation_html;
    }
  }

  $(".list__info--name").on("click", function() {

    var clientValue = $(this).data("id");
    
    $.ajax({
      url: '/clients/selected_client',
      type: 'GET',
      data: { client_id: clientValue },
      dataType: 'json',
    })
    
    .done(function(data) {
      var quotation_html = buildHTML(data);
      $(".quotation__list").html(quotation_html);
    })

    .fail(function() {
      alert("読み込みに失敗しました");
    })
  });
});


// $(function() {

//   function buildHTML(quotation) {

//     $.each(quotation, function(i, val) {

//       console.log(i+':'+val);
   
//     });

//       var html = 
//       `<ul class="quotation__list">
//         <a href="/quotations/${quotation.id}">
//           <div class="quotation__list--all">
//             <li class="quotation__list--name">
//               ${quotation.name}
//             </li>
//             <li class="quotation__list--date">
//               ${quotation.created_at}
//             </li>
//           </div>
//         </a>
//       </ul>`;
//       return html;
//     // });
//   }

//   $(".list__info--name").on("click", function() {

//     var clientValue = $(this).data("id");
    
//     $.ajax({
//       url: '/clients/selected_client',
//       type: 'GET',
//       data: { client_id: clientValue },
//       dataType: 'json',
//     })
    
//     .done(function(data) {
//       var html = buildHTML(data);
//       $(".quotation__list").html(html);
//     })

//     .fail(function() {
//       alert("読み込みに失敗しました");
//     })

//   });
// });
