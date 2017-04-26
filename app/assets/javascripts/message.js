$(function() {

  function buildHTML(data) {
    var html = '<li id="js-message">\n<h3 class="message__user__name">' + data.message.user_name + '</h3>\n<h4 class="message__date">' + data.message.time + '</h4>\n<p class="message__text">' + data.message.body + '</p>\n</li>';
    return html;

  }

  $('.new_message').on('submit', function(e) {
    e.preventDefault();
    console.log("aaa");
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
