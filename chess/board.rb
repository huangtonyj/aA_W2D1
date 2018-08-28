require_relative 'piece.rb'

class Board
  attr_reader :rows
  
  # white_piece_hash = {
  #   :queen => [[7,4]],
  #   :king => [[7,3]],
  #   :rook => [[7,0], [7,7]]  
  # }
  
  def initialize
    @rows = Array.new(8) { Array.new(8) {NullPiece.new(nil, self, nil)} }
    
    # white_piece_hash.each do |piece, positions|
    #   positions.each do |position|
    #     piece = Piece.new('white', @rows, position)
    #     add_piece(piece, position)
    #   end
    # end
    w_queen = Queen.new(:W, self, [7,4])
    o_queen = Queen.new(:W, self, [6,4])
    b_queen = Queen.new(:B, self, [0,4])
    
  end
  
  def [](pos)
    row, col = pos
    rows[row][col]
  end 
  
  def []=(pos, val)
    row, col = pos
    rows[row][col] = val
  end 
  
  def move_piece(color, star_pos, end_pos)
    begin
      if @rows[star_pos] == nil 
        raise StandardError 
      end
    rescue 
      p 'choose a different location to move from'
    end 
  
        
    row, col = star_pos
    piece = @rows[row][col]
    
    begin 
      if @rows[end_pos].color == piece.color 
        raise StandardError
      end
    rescue
      p 'choose a different location to move to'
    end  
    piece.pos = end_pos
    row2, col2 = end_pos
    @rows[row2][col] = piece
    
    @rows[row][col] = nil
    @rows
  end 
  
  def valid_pos?(pos)
  end 
  
  def add_piece(piece, pos)
    @rows[pos] = piece
  end 
  
  def checkmate?(color)
  end 
  
  def in_check?(color)
  end 
  
  def find_king(color)
  end 
  
  def pieces
  end 
  
  def dup
  end 
  
  def move_piece!(color, start_pos, end_pos)
    
  end 
  
end

if __FILE__ == $PROGRAM_NAME

b = Board.new
end 
