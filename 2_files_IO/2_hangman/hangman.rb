#game logic:
#start game, intake user name? potentially to save several games?
#intake number of acceptable guesses
#
#menu option to save or guess word invoked by :s & :g respectively
#-provide option to guess the mystery word at anytime through the above options
#
#loop through:
#-reveal mystery_words letters via _ _ _ *underscores && words must be 5+ letters
#-intake guess
#-check if letter is in mystery word:
##=> if letter is in mystery word, reveal letter
##=> else add to list of letters already guessed
#-update list of letters guessed and those within mystery word
#
#things to remember:
# no repeat letters, reject input/guess
# 
require 'pry'
require 'yaml'


class Mystery_word
  attr_accessor :word, :hidden
  def initialize
    @word = get_mystery_word
    @hidden = create_hidden_string
  end
  
  def number_of_lines
    count = 0
    File.foreach("5desk.txt").inject(0){|c, line| count+1}
    count
  end
  
  def get_mystery_word
    mystery_word = String.new
    content = File.open("5desk.txt", "r")
    eligible_words = content.split.select {|word| word.length <5 && word.length >12}
    mystery_word = eligible_words[rand(eligible_words.length)]  
  end
  
  def acceptable_mystery_word?(word)
    if word.size < 5 || word.size > 12 
      return false
    else
      return true
    end
  end
  
  def create_hidden_string #string
    string = String.new
    @word.length.times do
      string << "_ "
    end
    string
  end
  
  def hidden_update(index, guess)
    updated_index = index.map{|index| index *2}
    #binding.pry
    updated_index.each do |index|
      @hidden[index] = guess
    end
    #binding.pry
  end
    
end

class Game
  BANNER = "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  
  
    We have randomly picked a mystery word. You job is to decipher it!\n
    You can try to solve at anytime by typing ':SOLVE', but if you are wrong that is considered 1 guess. \n 
    Similarly, you can save by pressing ':SAVE'. Your place in the game will be recalled by the name you \n 
    input in the beginning, so by inputting the same name you will return to the last point in which you \n 
    saved your game. \n\n\n++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  
  attr_accessor :max_guesses, :guesses, :prior_letters, :wrong_words
  
  def initialize
    @player_name = String.new
    @max_guesses = 1
    @prior_letters = Array.new
    @mystery_word = Mystery_word.new
    @guess = String.new
    @wrong_words = Array.new
    @game_end = false
    @temp_message = String.new
  end
  
 
  def input_name_and_max
    puts "Please give us your name"
    @player_name = gets.chomp
    puts "Please input the maximum number of guesses you would like"
    @max_guesses = gets.chomp.to_i
  end
  
  def save
    yaml = YAML::dump(self)
    game_file = File.new("game1.yaml", "w")
    game_file.write(yaml)
    @game_end = true    
  end  
  
  def solve
    puts "Please input your answer"
    answer = gets.chomp.upcase
    binding.pry
    if answer == @mystery_word.word
      puts "***Congrats You figured it out!***"
      @game_end = true
    else
      @wrong_words << answer
      @temp_message << "***Ahh GOTCHYA! That was wrong***"
    end
  end
  
  def replay
    puts "Would you like to play again?"
    input = gets.chomp    
  end
  
  def input
    update_display(i)
    puts "Please guess a letter"
    input = gets.chomp.upcase
    if input == ":SOLVE"
      solve
      return
    elsif input == ":SAVE"
      save
    elsif input.size == 1
      @guess[0] = input[0]
      if @prior_letters.include?(@guess) == false
        @prior_letters << @guess.dup
      else
        @temp_message << "***You have put that letter before!***"
        input
      end
    else
      @temp_message << "***Sorry that was an incorrect input. Please put either a single letter, :SOLVE or :SAVE.***"  
      input 
    end     
  end
  
  def revealed_check
    if @mystery_word.hidden.include?("_") == false    
      @game_end = true
      @temp_message << "*** CONGRATS YOU FIGURED IT OUT!!! ***" 
    else
    end
  end
  
  def update_mystery_word
    index = Array.new
    for i in 0..@mystery_word.word.length-1 do
      index << i if @mystery_word.word[i] == @guess
    end
    @mystery_word.hidden_update(index, @guess)         
  end
   
  def update_display(i)
    system 'clear'
    puts BANNER
    puts ""
    puts ""
    puts "Player Name:"
    puts "=>#{@player_name}"
    puts ""
    puts "turn / maximum number of guess:"
    puts "=>#{i} / #{@max_guesses}"
    puts "Here are the prior letters you have guessed so far:"
    @prior_letters.each{|letter| p letter}
    puts ""
    puts "Here are the prior words you have guessed so far:"
    @wrong_words.each{|word| p word}
    puts ""
    puts ""
    puts "Mystery word : #{@mystery_word.hidden}" 
    puts ""
    puts @temp_message 
    @temp_message = ""
    puts ""    
  end  
  
  def play
    input_name_and_max if @player_name.empty?
    puts BANNER
    puts ""
    puts ""  
    for i in 1..@max_guesses do
      input(i)  #updates @guess 
      #check_prior_guesses  # updates @prior_guesses
      break if @game_end == true
      update_mystery_word# @mystery_word.hidden is updated?
      revealed_check  
      update_display(i)
      break if @game_end == true    
    end
  end  
end

class Engine
  attr_accessor :game
  def initialize
    @game = Game.new
  end
    
  def load
    game_file = File.open("game1.yaml", "r"){|file| file.read}
    YAML.load(game_file)
  end
 
  def load?
    puts "Would you like to load and old game?"
    response = gets.chomp.upcase[0]
    if response == "Y"
      return true
    end
  end
  def start    
    puts "Welcome to hangman!"
    game = load? ? load : Game.new
    game.play
  end  
  
end

Engine.new.start


