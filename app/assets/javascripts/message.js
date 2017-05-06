$(function() {

  function buildHTML(message) {
    var html = (`<li id="js-message" data-id=${ message.id }>
      <h3 class="message__user__name">${ message.user_name }</h3>
      <h4 class="message__date">${ message.time }</h4>
      <p class="message__text">${ message.body }</p>
      <p class="message__image"><img src="${ message.image }" alt="title" class="image-404-replace" onerror="this.style.display='none'"/></p>
      </li>`);
    $('#js-messages').append(html);
  }

  $('#js-message-form').on('submit', function(e) {
    e.preventDefault();
    var textField = $('.chat__input__area');
    var message = textField.val();
    var formData = new FormData($('#js-message-form').get(0))
    var url = location.pathname;

    $.ajax({
      type: 'POST',
      url: url,
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data.message);
      $(".chat__messages").scrollTop($(".chat__messages")[0].scrollHeight);
      $(".alert").hide();
      $("#flash-message").append('<div class="alert alert-info">メッセージの送信が完了しました。</div>');
      textField.val('');
      $(".chat__input__send__btn").prop('disabled', false);
    })
    .fail(function() {
      $(".alert").hide();
      $("#flash-message").append('<div class="alert alert-danger">メッセージを入力してください。</div>');
      $(".chat__input__send__btn").prop('disabled', false);
    });
  });

  $(".fa-photo").on("click", function() {
    $("#image-select-btn").click();
  });

  $("#js-messages").on("click",function() {
    var lastId = $("#js-messages li").last().data('id');
    AutomaticUpdating();
  });

  function AutomaticUpdating() {
    var url = location.pathname;
    var lastId = $("#js-messages li").last().data('id');

    $.ajax({
      type: 'GET',
      url: url,
      data: {
        message_id: lastId
      },
      dataType: 'json'
    })
    .done(function(data) {
      $(".alert").hide();
      if (data.messages.length !== 0) {
        $.each(data.messages, function(i, message) {
          buildHTML(message);
        });
        $(".chat__messages").scrollTop($(".chat__messages")[0].scrollHeight);
      }
    })
    .fail(function(message) {
      $(".alert").hide();
       $("#flash-message").append('<div class="alert alert-danger">メッセージを更新できません。</div>');
    });
  }
  setInterval(AutomaticUpdating, 1000);
});
