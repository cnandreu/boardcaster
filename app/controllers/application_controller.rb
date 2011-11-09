class ApplicationController < ActionController::Base
  protect_from_forgery

  def not_authenticated
    redirect_to login_url, :alert => "First login to access this page."
  end


  #FENs that dont work from the DB:
  #  Move Load (0.3ms)  SELECT "moves".* FROM "moves" WHERE "moves"."game_id" = 22
  #=> ["rnbqkbnr/pppppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1", 
  #    "rnbqkbnr/pp1ppppp/8/8/4P3/8/PPPP1PPP/RNBQKBNR b KQkq e3 0 1"] 

  def fenalg(fens)
    moves = []
    char='_'
    fens.map! { |fen| fen[0,fen.index(/\s/)].split('/').each { |rank|
      rank.gsub!(/\d/) {|d| char*Integer(d)}}}.each_cons(2) { |a, b| rank=0
      a.zip(b).each do |ra, rb| 8.times {|file| ra_chr = ra[file]
        rb_chr = rb[file]
        act_rank = 8-rank
        act_file = (file+65).chr
        if ra_chr != rb_chr
          if ra_chr == char
            if rb_chr.downcase == 'p'
              moves.push("#{act_file}#{act_rank}")
            else
              moves.push("#{rb_chr}#{act_file}#{act_rank}")
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
