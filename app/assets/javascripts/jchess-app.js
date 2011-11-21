jQuery(document).ready(function() {

    if(document.getElementById("board-live")!=null){	
	   setInterval(function() {	
		
		
   
		$.get("/moves", function(result){

            if(result == "***" && window.location.href.substr(-2) !== "?r"){
                window.location="/mgame";
                /*window.location = window.location.href + "?r"; */
                
            }

            $('#board-live').chess({fen : "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"}).clearBoard();

            var myobj = {fen : ""};

            myobj.fen = result;

		      $('#board-live').chess(myobj);
		    });
        
		
	   }, 1000);
	   $.ajaxSetup({ cache: false });
    }

  //setTimeout($('.success, .notice').fadeOut(5000), 15000);

/*
  var chess2 = $('#board').chess({fen : "rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2"});

*/


  var chess = jQuery('#board').chess({pgn : jQuery('#pgn-string').html()});

  jQuery('#board-back').click(function() {
    chess.transitionBackward();
    jQuery("#board-annot").text( chess.annotation() );
    return false;
  });
  
  jQuery('#board-next').click(function() {
    chess.transitionForward();
    jQuery("#board-annot").text( chess.annotation() );
    return false;
  });
  
  jQuery('#board-flip').click(function() {
    chess.flipBoard();
    return false;
  });  



})


