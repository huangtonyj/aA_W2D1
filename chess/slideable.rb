module Slideable
  LATERAL_DIRS = [[0,-1], [0,1], [-1,0], [1,0]]
  DIAGONAL_DIRS = [[-1,-1], [-1,1], [1,1], [1,-1]]
   
  def lateral_dirs 
    LATERAL_DIRS
  end
  
  def diagonal_dirs
    DIAGONAL_DIRS
  end 
  
  def moves
    moves_array = []  
    
    move_dirs.each do |dir|
      moves_array += grow_unblocked_moves_in_dir(LATERAL_DIRS) if dir == 'lateral' 
      moves_array += grow_unblocked_moves_in_dir(DIAGONAL_DIRS) if dir == 'diagonal' 
    end
    
    moves_array.uniq
  end
  
   
  private 
  
  def grow_unblocked_moves_in_dir(directions)
    directional_moves_arr = []
    
    directions.each do |direction| 
      next_pos = @pos
      
      while true        
        next_pos = [next_pos[0] + direction[0], next_pos[1] + direction[1]]
          break unless @board.valid_pos?(next_pos)
        
        next_piece = @board[next_pos]
          break unless next_piece.is_a?(NullPiece)
        
        directional_moves_arr += [next_pos]
      end
    end
    
    directional_moves_arr
  end 
end 