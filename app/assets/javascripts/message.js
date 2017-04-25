$(function() {
  function buildHTML(data) {
    var html = $('<p class="message__text">').append(data.message.body);
    return html;
  }

  $('.chat__input__send__btn').on('click', function(e) {
    e.preventDefault();
    var textField = $('.chat__input__area');
    var message = textField.val();
    var url = location.pathname;

    $.ajax({
      type: 'POST',
      url: url,

      data: {
        message: {
        body: message
        }
      },
      dataType: 'json'
    })

    .done(function(data) {
      var html = buildHTML(data);
      $('.chat__messages').append(html);
      textField.val('');
    })

    .fail(function() {
      alert('error');
    });
  });
});
