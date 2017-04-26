$(function() {

  function buildHTML(data) {
    var user_name = $('<h3 class="message__user__name">').append(data.message.user_name);


    var time = $('<h4 class="message__date">').append(data.message.time);


    var body = $('<p class="message__text">').append(data.message.body);
    var html = $('<li id="js-message">').append(user_name, time, body);
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
      $('#js-messages').append(html);
      $(".chat__messages").scrollTop($(".chat__messages")[0].scrollHeight);
      $(".alert").hide();
      $("#flash-message").append('<div class="alert alert-info">メッセージの送信が完了しました。</div>');
      textField.val('');
    })

    .fail(function() {
      $(".alert").hide();
      $("#flash-message").append('<div class="alert alert-danger">メッセージを入力してください。</div>');
    });
  });
});
