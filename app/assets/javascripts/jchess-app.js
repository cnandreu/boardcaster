/* 
 * @author: Carlos Andreu
 *
 * This file includes the necessary code to work with live games. If the board
 * has a "board-live" div class tag, it calls /moves via GET, it clears the
 * old board and updates the current empty board with the new FEN. If it gets
 * "***" that means the game is over and it sends a request to /mgame where the
 * game will be marked live=false and the user will be redirected to the last
 * game page and controls for 'Next Move", "Previous Move" and "Flip Board"
 * will appear below the board. 
 */

jQuery(document).ready(function() {
    
    //Fade notification bars (ie. "Login Successful" green bars)
    //setTimeout($('.success, .notice').fadeOut(5000), 15000);

    if(document.getElementById("board-live")!=null){	
	   setInterval(function() {	
		
		$.get("/moves", function(result){

            if(result == "***" && window.location.href.substr(-2) !== "?r"){
                window.location="/mgame";
                /* Old way of redirecting after the game was over:
                 * window.location = window.location.href + "?r"; */        
            }

            $('#board-live').chess({fen : "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1"}).clearBoard();

            var myobj = {fen : ""};

            myobj.fen = result;

		      $('#board-live').chess(myobj);
		    });
	   }, 1000); //Update interval in milliseconds, polls the DB for a new move.
	   $.ajaxSetup({ cache: false });
    }

    //Code for displaying replays
    var chess = jQuery('#board').chess({pgn : jQuery('#pgn-string').html()});

    jQuery('#board-back').click(function() { //previous move functionality
        chess.transitionBackward();
        jQuery("#board-annot").text( chess.annotation() );
        return false;
    });
  
    jQuery('#board-next').click(function() { //next move functionality 
        chess.transitionForward();
        jQuery("#board-annot").text( chess.annotation() );
        return false;
    });
  
    jQuery('#board-flip').click(function() { //flip board functionality
        chess.flipBoard();
        return false;
    });  

}) //end document.ready
