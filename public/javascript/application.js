$( document ).ready(function() {

	function showBeat(ord){
		$('#beats-' + ord).show();
		$('#cues-' + ord).show();
	}

	var beat_counter = parseInt($("#beat-order").val());

	function save_game_state() {
		$.ajax({
			url: '/games/save',
			method: 'POST',
			data: {game_id: $('#game-id').val(), campaign_id: $('#campaign-id').val(), beat_order: beat_counter}
		});
		if((beat_counter+1) >= (all_beats.length)){
		$(location).attr('href', '/campaigns/' + $('#campaign-id').val() + '/rating');
		}
	};


	$('#beats-list').on('shown.bs.tab', 'a[data-toggle="tab"]', function(e){
		if($(e.target).data('role') === "preview"){
			//Switched to preview
			var editor = $(e.relatedTarget.getAttribute('href') + ' textarea');
			var preview = $(e.target.getAttribute('href') + ' > div');
			preview.html(marked(editor.val()));
		}
	});

	var all_beats = $('[id^=beats]');
	var all_cues = $('[id^=cues]');

	showBeat(beat_counter);

	$('.next-beat').click(function(){
		if(beat_counter+1 < all_beats.length){
			all_beats.hide();
			all_cues.hide();
			showBeat(++beat_counter);
			save_game_state();
		}
	});

	$('.prev-beat').click(function()
	{
		if(beat_counter > 0){
			all_beats.hide();
			all_cues.hide();
			showBeat(--beat_counter);
			save_game_state();
		}
	});

	$('.cue-card-btn').click(function(e){
		e.preventDefault;
		$(this).parent().toggleClass('open');
		$(this).children('span').toggleClass('glyphicon-question-sign glyphicon-remove-sign');
	});


	var template = $('#beat-template');
	if(template.length > 0){
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
  
 	if (/campaigns\/\d+\/play/.test(document.URL)){
	 
	 	$(document).on("mousemove", function(e){
	 		if(e.clientY > .66 * $(window).height()){
	 			$('#play-game-nav').addClass('shown');
	 			// $('#game-nav-triangle>a>span').removeClass('glyphicon-triangle-top').addClass('glyphicon-triangle-bottom');
	 		}else{
	 			$('#play-game-nav').removeClass('shown');
	 			// $('#game-nav-triangle>a>span').removeClass('glyphicon-triangle-bottom').addClass('glyphicon-triangle-top');
	 		}
	 		if(e.clientY < .33 * $(window).height()){
	 			$('#top-nav-bar').addClass('shown');
	 			$('#top-nav-bar').removeClass('hideme');
	 		}else{
	 			$('#top-nav-bar').removeClass('shown');
	 			$('#top-nav-bar').addClass('hideme');
	 		}
		});
		$(document).keydown(function(e) {
	    switch(e.which) {
	        case 37: // left
	        	if(beat_counter > 0){
							all_beats.hide();
							showBeat(--beat_counter);
							save_game_state();
						}
	        	break;

	        case 39: // right
	        	if(beat_counter+1 < all_beats.length){
							all_beats.hide();
							showBeat(++beat_counter);
							save_game_state();
						}
	        	break;
	        default: return; // exit this handler for other keys
	    }
	    e.preventDefault(); // prevent the default action (scroll / move caret)
		});
	}

	$(".stars .star").click(function(e){
		$("#save").data('rating', $(this).val());
		console.log($(this).val());
	});

	// $("#save").click(function(e){
	// 	$.ajax({
	// 		url: '/games/rating/save',
	// 		method: 'POST',
	// 		data: {campaign_rating: $(this).data("rating"), game_id: $(this).data("game")}
	// 	});

	// });

	var mouseTimer = null, cursorVisible = true;

  function disappearCursor() {
      mouseTimer = null;
      document.body.style.cursor = "none";
      cursorVisible = false;
  }

  document.onmousemove = function() {
      if (mouseTimer) {
          window.clearTimeout(mouseTimer);
      }
      if (!cursorVisible) {
          document.body.style.cursor = "default";
          cursorVisible = true;
      }
      mouseTimer = window.setTimeout(disappearCursor, 5000);
  };

});
