require_relative 'piece.rb'
require_relative 'slideable.rb'

class Bishop < Piece
  include Slideable
  
  def to_s
    @color == :W ? "♗" : "♝"
  end
  
  def move_dirs
    ['diagonal']
  end
end