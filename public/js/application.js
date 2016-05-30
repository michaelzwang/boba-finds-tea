$(document).ready(function () {

  $('#like-link').on('click', function(event){
    event.preventDefault();
    var url = $(this).attr('href');
    $.ajax({
      method: "GET",
      url: url
    }).done(function(response){
      $('#like-count').html(response.like_count)
      $('#'+response.id).replaceWith("<img class='icon-imgs' src='/imgs/like.png'>")
    });
  });

});
