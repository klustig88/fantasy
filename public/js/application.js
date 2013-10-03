$(document).ready(function() {
  $('#create_player').on('submit', function(e){
    e.preventDefault();
    var first_name = $('#first_name').val();
    var last_name = $('#last_name').val();
    var position = $('#position').val();
    var team = $('#team').val();
    var url = $(this).attr('action');
    var data = $(this).serialize();
      $.post(url, data, function(results){
      $('tbody#player_table').append(results);
    });
  });
});
