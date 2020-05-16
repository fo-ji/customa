$(function(){
  $(".quotation__list").sortable({
    update: function(e, ui){
      var document = ui.document;
      var document_data = document.data();
      var params = {_method: 'put'};
      params[document_data.modelName] = { row_order_position: document.index() }
      $.ajax({
        type: 'POST',
        url: document_data.updateUrl,
        dataType: 'json',
        data: params
      });
    }
  });
});
