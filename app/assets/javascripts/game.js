$(document).ready(function() {

  var buttons = $('input[type=submit]');
  var score = $('.score');
  var cube = $('.cube');

  buttons.on('click', function(event) {
    event.preventDefault();

    buttons.attr('disabled', 'disabled');

    var guess = event.target.className;
    var url = $(event.target).parent().attr('action');
    var token = $('input[name=authenticity_token]').val();

    $.ajax({
      url: url,
      type: 'PUT',
      contentType: 'application/json',
      data: JSON.stringify({
        commit: guess,
        authenticity_token: token,
      }),
      dataType: 'json',
    })
    .done(function(data) {
      score.text(data.score);
      cube.removeClass('green');
      cube.removeClass('red');
      cube.addClass(data.current_color);
      buttons.attr('disabled', false);
    })
  });
})
