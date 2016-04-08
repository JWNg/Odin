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

  

class Mystery_word
  attr_accessor :word, :hidden
  def initialize
    @word = "abaci".upcase
    @hidden = create_hidden_string
  end
  
  def create_hidden_string #string
    string = String.new
    @word.length.times do
      string << " _"
    end
    string
  end
  
  def hidden_update(index, guess)
    updated_index = index.map{|index| index *2}
    updated_index.each do |index|
      @hidden[index] = guess
    end
  end
    
end

class Game
  attr_accessor :max_guesses, :guesses, :prior_letters, :wrong_words
  
  def initialize
    @player_name = String.new
    @max_guesses = 1
    @prior_letters = Array.new
    @mystery_word = Mystery_word.new
    @guess = String.new
    @wrong_words = Array.new
  end
  
  def save(input)#INCOMPLETE
  end
  
  def input_name_and_max
    puts "Please give us your name"
    @player_name = gets.chomp
    puts "Please input the maximum number of guesses you would like"
    @max_guesses = gets.chomp.to_i
  end
  
  #def exit_replay #INCOMPLETE    
  #end
  
  def solve# INCOMPLETE
    puts "Please input your answer"
    answer = gets.chomp
    if answer == @mystery_word.word
      puts "Congrats You figured it out!"
    else
      @wrong_words << answer
      puts "Ahh GOTCHYA! That was wrong"
    end
  end
    
  #def check_prior_guesses
  #  if @prior_letters.include?(@guess) == true       
  #    begin
  #    puts "you have already picked this letter before"
  #    @guess = gets.chomp.upcase[0]
  #    end until @prior_letters.include?(@guess) == false
  #  end      
  #end
  
  def input #need to complete save and guess function
    puts "Please guess a letter"
    input = gets.chomp.upcase
    if input == ":SOLVE"
      solve
      return
    elsif input == ":SAVE" #INCOMPLETE
          
    elsif input.size == 1
      binding.pry
      @guess[0] = input[0]
      binding.pry
      if @prior_letters.include?(@guess) == false
        @prior_letters << @guess.dup
      else
        puts "You have put that letter before!"
        input
      end
    else
      puts"Sorry that was an incorrect input. Please put either a single letter, :SOLVE or :SAVE."  
      input 
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
    puts "Player Name: #{@player_name}"
    puts "turn / maximum number of guess: #{i} / #{@max_guesses}"
    puts "Here are the prior letters you have guessed so far:"
    p @prior_letters
    puts "Here are the prior words you have guessed so far:"
    @wrong_words.each{|word| p word + " "}
    puts ""
    puts ""
    puts "Mystery word : #{@mystery_word.hidden}"    
  end  
  
  def play
    puts "Welcome to hangman!"
    input_name_and_max
    system 'clear'
    puts "We have randomly picked a mystery word. You job is to decipher it!\n
    You can try to solve at anytime by typing ':SOLVE', but if you are wrong that is considered 1 guess. \n 
    Similarly, you can save by pressing ':SAVE'. Your place in the game will be recalled by the name you \n 
    input in the beginning, so by inputting the same name you will return to the last point in which you \n 
    saved your game. \n"
    puts ""
    puts ""  
    for i in 1..@max_guesses do
      input  #updates @guess 
      #check_prior_guesses  # updates @prior_guesses
      update_mystery_word# @mystery_word.hidden is updated?
      update_display(i)
      puts i
    end
  end  
end


Game.new.play


