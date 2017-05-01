$(function() {
  var list = $(".chat-group-users");
  var preWord;

  function appendList(word) {
    var item = $('<li class="chat-group-user">').append(word);
    list.append(item);
  }

  function editElement(element) {
    var result = "^" + element;
    return result;
  }

  $("#user-search-field").on("keyup", function() {
    var input = $(this).val();
    var inputs = input.split(" ").filter(function(e) { return e; });
    var newInputs = inputs.map(editElement);
    var word = newInputs.join("|");
    var reg = RegExp(word);

    $.ajax({
      type: 'GET',
      url: '/users',
      data: {
          user: reg
      },
      dataType: 'json'
    })


    if (word != preWord) {
      $(".chat-group-user").remove();
      if(input.length !== 0) {
        $.each(user, function(i, user) {
          if (user.match(reg)) {
            appendList(user);
          }
        });
        if ($(".chat-group-user").length === 0) {
          appendList("一致するものはありませんでした");
        }
      }
    }
    preWord = word;
  });
});
