$(function() {
  var beat_template = $('#beat-template').html();
  $('.new-beat-btn').click(function(e){
    e.preventDefault();
    var beat_num = $('#beats-list>div.form-group').size() + 1;
    
    // $.get( "/beats/new/" + beat_num, function( data ) { $('#beats-list').append( data ); });
    $('#beats-list').append( beat_template.replace(/\{\{id\}\}/g, beat_num) );
    // test(beat_num);
  });
});
