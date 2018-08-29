require 'colorize'
require_relative 'board.rb'
require_relative 'cursor.rb'



class Display
  
  def initialize(board, cursor)
    @board = board 
    @cursor = Cursor.new([0,0], board)
  end
  
  def render
    print "  "
    (0..7).each do |c|
      print "#{c} "
    end
    print "\n"
    
    (0..7).each do |row|
      print "#{row} "
      (0..7).each do |col|
        if @cursor.cursor_pos == [row,col]
          print "#{@board[[row,col]]} ".colorize(:background => :blue )
        elsif (row + col).even?
          print "#{@board[[row,col]]} ".colorize(:background => :magenta )
        else 
          print "#{@board[[row,col]]} ".colorize(:background => :black )
        end 
      end 
      print "\n"
    end 
  end
  
  def temp_play
    while true
      render
      @cursor.get_input
      system("clear")
    end
  end
end 


if __FILE__ == $PROGRAM_NAME
  b = Board.new
  c = Cursor.new([0,0], b)
  d = Display.new(b, c)
  
  # d.temp_play
  p b[[7,1]].moves
end 
