require 'pry'


class Players
  attr_accessor :score, :role, :mystery_code
  
  def initialize
    @score = Fixnum.new(0)
    @mystery_code = Array.new
  end  
  
  def guess
  end
  
end

#class Combos
#  attr_accessor :code
#  
#  def initialize
#    @code = Array.new(4, " _ ")
#  end
#
#  #def feedback_from_guess(guess)
#  #  feedback = Array.new
#  #  guess.each do |letter| 
#  #    if letter ==   
#  #end
#end

class Board
  attr_accessor :guesses, :turn, :feedback_container, :combo_container
  
  def initialize    
    @mystery_code = Array.new(4, " _ ")
    @turn = 0
    @guesses = 0
    @feedback_container = Array.new(@guesses, [])
    @combo_container = Array.new(@guesses, [])
    #(0..@guesses-1).each{|x| @feedback_container[x] = Array.new(4, " _ ")}
    #(0..@guesses-1).each{|x| @combo_container[x] = Array.new(4, " _ ")}
    #binding.pry
    #Array of arrays
    #iterate up to number of guesses that was taken from start of game, default 12
  end
  
  def intake
    #split = Array.new
    string = ""
    begin
      puts "please input a combination in the following format (ie. 'ABCD')"
      string = gets.chomp.upcase
      puts "That was not an appropriate input, please try again" unless string =~ /[a-fA-F]{4}/ && string.size == 4             
    end until string =~ /[a-fA-F]{4}/ && string.size == 4
    combination = string.split(//)    
  end
    
  def feedback(i)
    black_markers = 0
    #temp_guess = Array.new
    #temp_mystery_code = Array.new
    temp_guess = @combo_container[i].dup
    temp_mystery_code = @mystery_code.dup
    puts temp_guess
    puts temp_mystery_code
    (0..3).each do |position|
      if temp_guess[position] == temp_mystery_code[position] 
        if temp_guess[position] == 'X'
          next
        else
          black_markers +=1
          temp_guess[position] = 'X'
          temp_mystery_code[position] = 'X' 
        end
      #else
      #  next
      end
    end
    binding.pry
    white_markers = 0
    temp_guess.each do|guess|
      if temp_mystery_code.include?(guess)
        white_markers += 1 unless guess == "X"
        index = temp_mystery_code.index(guess)
        temp_mystery_code.slice!(index)
      end
    end    
    feedback = Array.new
    black_markers.times do
      feedback << " B "
    end
    white_markers.times do
      #binding.pry
      feedback << " W "
    end
    @feedback_container[i] = feedback      
      
        
    
    #difference = @combo_container[i]- @mystery_code  #if you get back 4 objects, that means none were right, if you get back 1 object, that means 3 was right
    ##binding.pry
    #number_of_correct_letters = 4- difference.size 
    #number_of_black = 0
    #(0..3).each do |number|
    #  number_of_black += 1 if @mystery_code[number] == @combo_container[i][number]
    #end
    #binding.pry
    #number_of_white = number_of_correct_letters - number_of_black
    #feedback = Array.new
    #number_of_black.times do
    #  feedback << " B "
    #end
    #number_of_white.times do
    #  #binding.pry
    #  feedback << " W "
    #end
    #@feedback_container[i] = feedback 
  end  
    
  def update_board
    system 'clear'
    puts " GUESSES   =>    FEEDBACK "
    #puts " _ _ _ _   =>   _ _ _ _  " * @guesses - @turn
    #binding.pry
    (0..@turn).each do |turn|
      #binding.pry
      puts " #{@combo_container[turn][0]} #{@combo_container[turn][1]} #{@combo_container[turn][2]} #{@combo_container[turn][3]}   =>   #{@feedback_container[turn][0]} #{@feedback_container[turn][1]} #{@feedback_container[turn][2]} #{@feedback_container[turn][3]} "
    end
  end 
  
  def accept_guesses(i)
    puts "It is round #{i+1}"
    puts"Time to guess! What do you think the combination is?"
    @combo_container[i] = intake #i is the round the game is currently in, which is chosen at the start (default 12)
    #begin
    #  puts "please input a guess!"
    #  split = Array.new
    #  guess = gets.chomp.upcase!
    #  if guess.size != 4 
    #    puts "you must put in 4 letters from A-F"
    #    retry
    #  if guess.each_char{|letter| true unless letter =~ (/[ABCDEF]/)}
    #    puts "All your guesses must be from A-F"
    #    retry
    #  else
    #    split = guess.split(//)
    #    @combo_container[@turn] = split
    #  end
    #end        
  end
  
  def accept_mystery_code
    puts "Please input the mystery code!"
    @mystery_code = intake
    #holder = String.new 
    #i = 0    
    #puts "Please input the mystery code!"
    #until i >3
    #  until @mystery_code[i] =~ (/[ABCDEF]/)
    #    puts "Which letter(A-F) would you like to put in position#{i+1}?"
    #    holder = gets.chomp.upcase! # => NoMethodError: undefined method `chomp' for nil:NilClass
    #    @mystery_code[i]= holder[0]
    #    puts "please put a letter from A-F" unless @mystery_code[i] =~ (/[ABCDEF]/)    
    #  end
    #  i += 1 if @mystery_code[i] != 'x'
    #end
  end
end

class Game
  attr_accessor :rounds, :guesses
  def initialize
    @rounds = 0
    @board = Board.new
  end
  
  def start
    until @rounds > 0 # => false
      puts "Welcome to Mastermind, How many rounds would you like in this game?" 
      @rounds = gets.chomp.to_i # ~> NoMethodError: undefined method `chomp' for nil:NilClass
      puts"please input a number(ie. 1)" if @rounds == 0
    end
    until @board.guesses > 0 # => false
      puts "How many guesses would you like in this game?" 
      @board.guesses = gets.chomp.to_i # ~> NoMethodError: undefined method `chomp' for nil:NilClass
      puts"please input a number(ie. 1)" if @board.guesses == 0
    end
    (0..@board.guesses-1).each{|x| @board.feedback_container[x] = Array.new(4, " _ ")}
    (0..@board.guesses-1).each{|x| @board.combo_container[x] = Array.new(4, " _ ")}
  end
      
  def game   
    start
    for i in 0..@board.guesses-1
      @board.turn = i
      @board.update_board
      @board.accept_mystery_code if i == 0
      puts "Ok, NOW! for the mastermind to crack the code!" if i == 0
      @board.accept_guesses(i)
      @board.feedback(i)
      @board.update_board
      puts " It is the end of round #{i+1} of the guesses, have you cracked the code?"
      
    end  
  end
    
  #loop through # of rounds(set at start of the game)
  #for i in 1..n # n is the number of rounds
    #codemaker sets code 
    #loop through the guesses done by the codebreaker for n times (default 12, set at start)
    #end
end

Game.new.game

