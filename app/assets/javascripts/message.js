$(function() {
  function build_body(message) {
    var body = $('<p class="message__text">').append(message.body);
    return body;
  }

  function build_time(message) {
    var time = $('<h4 class="message__date">').append(message.created_at);
    return time;
  }

 $('.chat__input__send__btn').on('click', function(e) {
    e.preventDefault();
    var textField = $('.chat__input__area');
    var message = textField.val();
    $.ajax({
      type: 'POST',
      data: {
        message: {
          body: message,
          time: message
        }
      },
      dataType: 'json'
    })

    .done(function(data) {
      var time = build_time(data);
      $('.chat__messages').append(time);

      var body = build_body(data);
      $('.chat__messages').append(body);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    });
  });
});
