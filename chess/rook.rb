require_relative 'piece.rb'
require_relative 'slideable.rb'

class Queen < Piece
  include Slideable
  
  def to_s
    @color == :W ? "♖" : "♜"
  end
  
  def move_dirs
    ['lateral']
  end
end