class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_authenticated
    redirect_to login_url, :alert => "First login to access this page."
  end


=begin
FENS = ["rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR b KQkq - 0 1",
        "rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq - 0 1",
        "rnbqkbnr/pp1ppppp/8/2p5/4P3/8/PPPP1PPP/RNBQKBNR w KQkq - 0 1",
        "rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 0 1",
        "rnbqkbnr/pp2pppp/3p4/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R w KQkq - 0 1",
        "rnbqkbnr/pp2pppp/3p4/2p5/3PP3/5N2/PPP2PPP/RNBQKB1R b KQkq - 0 1",
        "rnbqkbnr/pp2pppp/3p4/8/3pP3/5N2/PPP2PPP/RNBQKB1R w KQkq - 0 1",
        "rnbqkbnr/pp2pppp/3p4/8/3NP3/8/PPP2PPP/RNBQKB1R b KQkq - 0 1",
        "rnbqkb1r/pp2pppp/3p1n2/8/3NP3/8/PPP2PPP/RNBQKB1R w KQkq - 0 1",
        "rnbqkb1r/pp2pppp/3p1n2/8/3NP3/2N5/PPP2PPP/R1BQKB1R b KQkq - 0 1",
        "rnbqkb1r/1p2pppp/p2p1n2/8/3NP3/2N5/PPP2PPP/R1BQKB1R w KQkq - 0 1",
        "rnbqkb1r/1p2pppp/p2p1n2/8/3NP3/2N1B3/PPP2PPP/R2QKB1R b KQkq - 0 1",
        "rnbqkb1r/1p3ppp/p2p1n2/4p3/3NP3/2N1B3/PPP2PPP/R2QKB1R w KQkq - 0 1",
        "rnbqkb1r/1p3ppp/p2p1n2/4p3/4P3/1NN1B3/PPP2PPP/R2QKB1R b KQkq - 0 1"]

=end

  def fens2pgn(fens, event="Juan vs. Pedro",
             site="San Juan",
             date="1990.07.09",
             event_date="?",
             round="9000.1",
             result="0.1",
             white="Juan",
             black="Pedro",
             eco="c64",
             whiteelo="?",
             blackelo="?",
             plycount="56")

  pgn = "[Event \""+event+"\"]"
  pgn << "\n"
  
  pgn << "[Site \""+site+"\"]" << "\n"
  pgn << "[Date \""+date+"\"]" << "\n"
  pgn << "[EventData \""+event_date+"\"]" << "\n"
  pgn << "[Round \""+round+"\"]" << "\n"
  pgn << "[Result \""+result+"\"]" << "\n"
  pgn << "[White \""+white+"\"]" << "\n"
  pgn << "[Black \""+black+"\"]" << "\n"
  pgn << "[ECO \""+eco+"\"]" << "\n"
  pgn << "[WhiteElo \""+whiteelo+"\"]" << "\n"
  pgn << "[BlackElo \""+blackelo+"\"]" << "\n"
  pgn << "[PlyCount \""+plycount+"\"]" << "\n"
  pgn << "\n"
  moves = fens2alg(fens)
  i = 0
  moves.each_slice(2){ |a,b|
    i+=1 
    pgn<< "#{i}.#{a} #{b} "
    if i%8 == 0
    pgn << "\n"
    end
  } 

  pgn
end

def fens2alg(fens)
  moves = []
  char='_'
  act_file = ''
  fens.map! { |fen| fen[0,fen.index(/\s/)].split('/').each { |rank|
      rank.gsub!(/\d/) {|d| char*Integer(d)}}}.each_cons(2) { |a, b| rank=0
    a.zip(b).each do |ra, rb| 8.times {|file| ra_chr = ra[file]
        # Board b, designated by rb is in the future
        rb_chr = rb[file]
        act_rank = 8-rank
        old_file = act_file        
        act_file = (file+65).chr

        if ra_chr != rb_chr
          if ra_chr == char
            if rb_chr.downcase == 'p'
              moves.push("#{act_file.downcase}#{act_rank}")
            else
              moves.push("#{rb_chr}#{act_file.downcase}#{act_rank}")
            end
          elsif ra_chr != char && rb_chr != char
            # Take b position
            #puts "Attack: #{ra_chr} <-> #{rb_chr}"
            if rb_chr.downcase == 'p'
              # This is a pawn move, get other side file
              moves.push("#{old_file.downcase}x#{act_file.downcase}#{act_rank}")
            else
              moves.push("#{rb_chr}x#{act_file.downcase}#{act_rank}")
            end
          end
        end
      }
      rank+=1
    end
  }
  moves
end


end
