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
  
  def initialize   
    @levels = Hash.new    
    @path = []
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
  end
  
  def find_end_destination
    for i in 0..@levels.size do
      @levels[i].each {|square| return square if square.x == @end.x && square.y == @end.y}
    end    
  end
  
  def find_path_taken
    destination = find_end_destination
    path = [[find_end_destination.x, find_end_destination.y]]
    begin
      path << [destination.parent.x, destination.parent.y]
      destination = destination.parent
    end until destination.parent == nil
    @path = path.reverse
  end
  
  def knight_moves(starting_position, ending_position)
    @start = Square.new(starting_position)
    @end = Square.new(ending_position)
    @levels[0] = [Square.new(starting_position)]
    
    #@start.x, @start.y = start[0], start[1]
    #@end.x, @end.y = end_state[0], end_state[1]
    build_tree
    path = find_path_taken
    p "You made it in #{path.size-2}, starting with:"
    path.each{|array| p array}
  end
  
end

p = Path_engine.new #([1,1], [6,5])
p.knight_moves([1,1],[1,2])

