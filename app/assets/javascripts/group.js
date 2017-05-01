$(function() {
  var list = $(".chat-group-users");
  var preWord;

  function appendList(name_list) {
    var user_name = $('<li class="chat-group-user">').append(name_list);
    list.append(user_name);
  }

    function editElement(element) {
    var result = "^" + element;
    return result;
  }


  $("#user-search-field").on("keyup", function() {
    var input = $(this).val();

    $.ajax({
      type: 'GET',
      url: '/users',
      data: {
        user: input
      },
      dataType: 'json'
    })


    .done(function(data) {

      $.each(data.users, function(i, user) {
        appendList(user.name);
    });
    })

    .fail(function() {
      appendList("一致するユーザーはいません。");
    });

  });
});
