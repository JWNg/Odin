#obects:
#board 8x8
#knight > attributes: position
#game engine > desires position
class Square
  attr_reader :x, :y, :parent
  def initialize(array)
    @x = array[0]
    @y = array[1]
  end
end

class Knight
  attr_accessor :position
  def initialize(position)
    @position = Square.new(position)
  end  
end

class Path_engine
  MOVES = [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]]
  SCOPE = 1..8
  
  attr_reader :destination
  
  def initialize(starting_position_x, starting_position_y, ending_position_x, ending_position_y)
    starting_position = [starting_positon_x, starting_position_y]
    ending_position = [ending_position_y, ending_position_y]
    @knight = Knight.new(starting_position)
    @destination = ending_postion
    @levels = Hash.new
    @levels[0] => [starting_position]
  end
  
  def print_route
  end
  
  def add_level(i)
    @levels[i-1].each do |sqaure|
      
    
  end
    
  def build_tree(starting_position)
    
    starting_position.each
    
  end
end

