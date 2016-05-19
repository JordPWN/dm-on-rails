$(document).ready(function() {
  $('.new-beat-btn').click(function(e){
    e.preventDefault();
    $('#beats-list').append(beat_field())
  })
  
  function beat_field() {
    var beat_num = $('#beats-list>div.form-group').size() + 1;
    return "<div class='form-group'><label for='Beat " + beat_num + "'>Beat " + beat_num + "</label><textarea class='form-control' rows='3' name='beat[]'></textarea></div>";
  }
});
