$( document ).ready(function() {

	var beat_counter = parseInt($("#beat-order").val());

	function save_game_state() {
		$.ajax({
			url: '/games/save',
			method: 'POST',
			data: {game_id: $('#game-id').val(), campaign_id: $('#campaign-id').val(), beat_order: beat_counter}
		});
	};

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
		save_game_state();
		
	});

		$('.prev-beat').click(function(){
		$("#beats-"+beat_counter).hide();
		beat_counter--;
		$("#beats-"+beat_counter).show();
		save_game_state();
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
