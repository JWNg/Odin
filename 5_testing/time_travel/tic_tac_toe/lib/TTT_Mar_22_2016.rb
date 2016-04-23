=begin
  board holds an hash with 9 keys where values are classault to something
  2 players objects
  game object that runs the game, inbetween every selection of position
  the game object will check for win or loss

objects:
-game engine
  -check winner
  -redo print screen
  -replay game? restart
  
-players
  -what positions they hold

-board
  -which positions are occupied by who?
  
=end
require 'pry'
#p "FROM TTT.RB FILE"
class Board
  WINNING_COMBINATIONS = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  attr_accessor :squares 
    
  def initialize
    @squares = {}
    (1..9).each{|position| @squares[position] = position.to_s }   #position.to_s
  end
  
  def win_check(symbol)
    WINNING_COMBINATIONS.any? do|combo| 
      @squares[combo[0]] == symbol && @squares[combo[1]] == symbol && @squares[combo[2]] == symbol
    end    
  end  
  
  def print
    system 'clear'
    puts "   #{@squares[1]} | #{@squares[2]} | #{@squares[3]}" 
    puts " --------------"
    puts "   #{@squares[4]} | #{@squares[5]} | #{@squares[6]}" 
    puts " --------------"
    puts "   #{@squares[7]} | #{@squares[8]} | #{@squares[9]}"   
  end  
    
end

class Player
  attr_accessor :marker
  
  def initialize(sign)
    @marker = sign
  end
  
end

class Game
  attr_accessor :board
  def initialize
    @board = Board.new
    @play = "Y"
    @player = Player.new("X")
    @computer = Player.new("O")   
    @unoccupied = [] 
    @replay = String.new          
  end
  
  def unoccupied_positions
    unoccupied = []
    @board.squares.each {|k, v| unoccupied << k if (v != "X" && v != "O") }# => {1=>"1", 2=>"2", 3=>"3", 4=>"4", 5=>"5", 6=>"6", 7=>"7", 8=>"8", 9=>"9"}
    unoccupied  # => [1, 2, 3, 4, 5, 6, 7, 8, 9]
    #binding.pry
  end
  
  def valid_move?(move)  
    if unoccupied_positions.any?{|space| space == move} 
      return true
    else
      return false
    end            
  end
  
  def random_move_generator
    unoccupied = unoccupied_positions
    unoccupied.sample
  end
    
  def intake_move(symbol)
    move = String.new
    if symbol == "X"      
      until valid_move?(move) == true
        puts "Pick a free spot"
        move = gets.chomp.to_i # ~> NoMethodError: undefined method `chomp' for nil:NilClass
        puts "Invalid move" if valid_move?(move) == false
        #binding.pry
      end
    else
      move = random_move_generator 
    end   
    log_move(move, symbol)
  end
  
  def log_move(move, symbol)
    @board.squares[move] = symbol    
  end
  
  def restart
    @board = Board.new
    
  end
      
  def replay?
    answer = String.new
    until answer == "Y" || answer == "YES" || answer == "NO" || answer == "N"
      puts "would you like to play again?"
      answer = gets.chomp.upcase!
      if answer == "Y" or answer == "YES"
        @replay = "true"
        return        
      elsif answer == "N" or answer == "NO"
        @replay = "false"
        return        
      end
      puts "Sorry please put Yes or No."
    end
  end    
      
  def play
    @board.print
    while @play == "Y" do
        restart   
      while @board.squares.any?{|k, v| v.to_i > 0} do
        #binding.pry
        @board.print
        intake_move("X")
        @board.print
        break if @board.win_check("X") == true
        #binding.pry
        intake_move("O")
        @board.print         
        break if @board.win_check("O") == true             
      end
      if unoccupied_positions.empty? 
        puts "The game was a tie!"
      elsif @board.win_check("X") == true
        puts "you won!!!"
      else @board.win_check("O") == true
        puts "you lost! BOOOOO!"
      end
      replay?
      @play = "N" unless @replay == "true"
    end   
  end 
   
end
#b = Game.new
#b.play

# >>    1 | 2 | 3
# >>  --------------
# >>    4 | 5 | 6
# >>  --------------
# >>    7 | 8 | 9
# >>    1 | 2 | 3
# >>  --------------
# >>    4 | 5 | 6
# >>  --------------
# >>    7 | 8 | 9
# >> Pick a free spot

# !> TERM environment variable not set.
# !> TERM environment variable not set.

# ~> NoMethodError
# ~> undefined method `chomp' for nil:NilClass
# ~>
