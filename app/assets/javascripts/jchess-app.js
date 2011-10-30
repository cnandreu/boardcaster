jQuery(document).ready(function() {

	
	   setInterval(function() {	
		
		$.get("/moves", function(result){
            $('#board').chess({fen : "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"}).clearBoard();

            var myobj = {fen : ""};

            myobj.fen = result;

		      $('#board').chess(myobj);
		    });
		
		
	   }, 1000);
	   $.ajaxSetup({ cache: false });


  //setTimeout($('.success, .notice').fadeOut(5000), 15000);

/*
  var chess2 = $('#board').chess({fen : "rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2"});


*/
 
})


