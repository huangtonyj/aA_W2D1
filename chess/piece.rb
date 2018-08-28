# require 'singleton'
 
class Piece
  # include 'singleton'
  
  attr_accessor :pos
  attr_reader :color
  
  def initialize(color, board, pos)
    @color = color
    @board = board 
    @pos = pos
  end
  
  def to_s
    "_"
  end
  
end


class NullPiece < Piece 
  def initialize(color, board, pos)
    super(nil, board, nil)
  end
  
  def moves 
  end
  
  def symbol
  end 
  
end

class Queen < Piece
  
  def initialize(color, board, pos)
    super(color, board, pos)
    @board[pos] = self
  end
  
  def to_s
    "Q"
  end
end