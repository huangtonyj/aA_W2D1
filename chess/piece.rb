require 'singleton'
 
class Piece
  attr_accessor :pos
  attr_reader :color
  
  def initialize(color, board, pos)
    @color = color
    @board = board 
    @pos = pos
  end
  
  def to_s
    " "
  end
end


class NullPiece < Piece 
  include Singleton
  
  def initialize
    super(nil, nil, nil)
  end
  
  def moves 
  end
  
  def symbol
  end 
  
  def inspect
    "|_____|"
  end
  
end

class King < Piece
  
  def initialize(color, board, pos)
    super(color, board, pos)
    @board[pos] = self 
  end 
  
  def to_s
    "K"
  end 
end 

class Rook < Piece

  def initialize(color, board, pos)
    super(color, board, pos)
    @board[pos] = self 
  end 

  def to_s
    "R"
  end 
end  

# class Bishop < Piece
# 
#   def initialize(color, board, pos)
#     super(color, board, pos)
#     @board[pos] = self 
#   end 
# 
#   def to_s
#     "B"
#   end 
# end 

class Knight < Piece
  
  def initialize(color, board, pos)
    super(color, board, pos)
    @board[pos] = self 
  end 
  
  def to_s
    "Kn"
  end 
end 

class Pawn < Piece
  
  def initialize(color, board, pos)
    super(color, board, pos)
    @board[pos] = self 
  end 
  
  def to_s
    "P"
  end 
end 
  