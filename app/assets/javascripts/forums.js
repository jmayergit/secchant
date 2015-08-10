$(document).on('ready page:load', function(e) {
  $('.ui.sticky')
    .sticky({
      context: '#bodyR',
      offset: 10
    })
  ;

  $('button').click(function(e) {
    var current_text = $("#" + textAreaId())[0].value;

  })

  function textAreaId() {
    var textarea = $('textarea')[0]

    return textarea.id
  };
});
