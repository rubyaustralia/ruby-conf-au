$(function() {
  $('#talk-proposal form').submit(function(e) {
    e.preventDefault();

    $form = $(e.target);
    data = $form.serialize();
    url = $form.attr('action');
    $.ajax({
      type: 'post',
      data: data,
      url: url,
      async: false,
      success: function(data) {
        $('#talk-proposal').slideUp('slow');
        $('#talk-proposal-success').slideDown('slow');
      },
      error: function(xhr) {
        console.log(xhr);
      }
    });
  });
});
