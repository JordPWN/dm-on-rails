$( document ).ready(function() {

	var beat_counter = parseInt($("#first-beat").val());

	// var save_game_state function(current_beat){
	// 	// var abc = $('.next-beat').data('beat')
	// 	$.ajax({
	// 		url: 'games/save',
	// 		method: 'POST',
	// 		// data: {beat_id: @campaign.beat.find_by(order: current_beat), game_id: current_user.game_id.find_by(campaign_id: )}
	// 	});
	// };

	$('#beats-list').on('shown.bs.tab', 'a[data-toggle="tab"]', function(e)
	{
		if($(e.target).data('role') === "preview")
		{
			//Switched to preview
			var editor = $(e.relatedTarget.getAttribute('href') + ' textarea');
			var preview = $(e.target.getAttribute('href') + ' > div');
			preview.html(marked(editor.val()));
		}
	});

	$('.next-beat').click(function(){
		$("#beats-"+beat_counter).hide();
		beat_counter++;
		$("#beats-"+beat_counter).show();
		save_game_state(beat_counter);
		
	});

		$('.prev-beat').click(function(){
		$("#beats-"+beat_counter).hide();
		beat_counter--;
		$("#beats-"+beat_counter).show();
		save_game_state(beat_counter);
	});


	var template = $('#beat-template');
	if(template.length > 0)
	{
	  var beat_template = Handlebars.compile(template.html());
	  $('.new-beat-btn').click(function(e){
	    e.preventDefault();
	    e.stopPropagation();
	    var beat_num = $('#beats-list>div.form-group').size() + 1;
	    $('#beats-list').append(beat_template({id: beat_num}));
	  });
	}

	$('.dropdown').hover(
		function() {
    	$( this ).addClass( "open" );
  	}, function() {
    	$( this ).removeClass( "open" );
  });
});
