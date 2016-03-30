#Pregame options:
# => number of guesses (default -> 12)
# => number of letters to guess (default -> 6)
# => number of games to play in total 
# => code maker or code breaker role
#===========================================================
##
#objects:
#=> players (score)
#=> board (update_board, display ongoing score, display games left/played, make code, assess correctness, provide feedback) 
#=> game
#=> combos (4 spots)
#Modules:
#-codemaker ( )
#-codebreaker (make guess)
#===========================================================
# 
# 
require 'pry'

module Codemaker
  attr_accessor :mystery_code      
end

module Codebreaker
  def guess
  end
end

class Players
  attr_accessor :score, :role
  
  def initialize
    @score = Fixnum.new(0)
  end  
end

class combos
  attr_accessor :code
  
  def initialize(entry)
    :code = Array.new(entry)
  end
end

class feedback_from_guess
  attr_accessor :feedback
  
  def initialize(entry)
    :feedback = Array.new(entry)
  end
end

class Board
  def initialize
    :feedback_container = {}
    #iterate up to number of guesses that was taken from start of game
  end
    
  def update_board
  end
  
  def provide_feedback
  end
  
  def accept_guesses
  end
  
  def update_display
  end

  def accept_mystery_code
  end
end

class Game
end

  






