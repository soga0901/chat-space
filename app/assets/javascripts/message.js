$(function() {

  function buildHTML(data) {
    var html = (`<li id="js-message">
      <h3 class="message__user__name">${ data.message.user_name }</h3>
      <h4 class="message__date">${ data.message.time }</h4>
      <p class="message__text">${ data.message.body }</p>
      <p class="message__image"><img src="${ data.message.image }" alt="title" class="image-404-replace" onerror="this.style.display='none'"/></p>
      </li>`);
    return html;
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

  $(".fa-photo").on("click", function() {
    $("#image-select-btn").click();
  });

});
