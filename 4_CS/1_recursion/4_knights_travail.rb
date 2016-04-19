require 'pry'

class Square
  attr_reader :x, :y, :parent
  def initialize(array, parent=nil)
    @x = array[0]
    @y = array[1]
    @parent = parent
  end
end

class Path_engine
  MOVES = [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]]
  SCOPE = 1..8
  
  attr_reader :destination
  
  def initialize(starting_position, ending_position)
    @start = Square.new(starting_position)
    @end = Square.new(ending_position)
    @levels = Hash.new
    @levels[0] = [Square.new(starting_position)]
  end
    
  def duplicate_move?(move, next_move)
    next_move.each do |square|                                     #prevents duplicate within the current iteration
      return true if square.x==move.x && square.y == move.y
    end
    for i in 0..@levels.size-1                                    #prevents duplicates with past moves
      for j in 0..@levels[i].size-1 
        return true if @levels[i][j].x == move.x && @levels[i][j].y == move.y
      end
    end
    return false    
  end
  
  def next_level(i)
    next_move = []
    @levels[i-1].each do |square|
      MOVES.each do |move|
        new_x = square.x + (move[0])
        new_y = square.y + (move[1])
        new_square = Square.new([new_x, new_y], square)
        next if duplicate_move?(new_square, next_move)                            #prevents duplicates
        next_move << new_square if SCOPE.include?(new_x) && SCOPE.include?(new_y) #ensures move is within the 8x8 boundary
      end
    end
    next_move    
  end
    
  def build_tree
    i = 1
    #until i == 4
    until next_level(i) == []
      @levels[i] = next_level(i)
      i += 1      
    end
    binding.pry     
  end
end

p = Path_engine.new([1,1], [2,2])
p.build_tree

