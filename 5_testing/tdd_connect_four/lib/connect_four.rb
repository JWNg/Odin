
require 'pry'
class Connect_four 
  

  attr_accessor :container
  attr_writer :finish
  
  def initialize 
    @container = [[],[],[],[],[],[],[]]
    @finish = false
  end 
  
  def intake_move(column, marker)
    array_number = column.to_i-1
    if array_number<0 || array_number>6 
      p "That was an invalid entry" 
      return false
    elsif @container[array_number].size >5 
      p "That column is full"
      return false    
    else
      @container[array_number] << marker 
      return true      
    end
  end
  
  def filled_check
    for i in 0..6 do
      return false if @container[i][5].nil?
    end
    true
  end
  
  def game_over_check(key)
    return true if checker(key, 0, 3, 0, 5, +1, 0) == true
    return true if checker(key, 0, 4, 0, 5, 0, +1) == true
    return true if checker(key, 0, 3, 0, 2, +1, +1) == true
    return true if checker(key, 3, 6, 0, 2, -1, +1) == true
    return true if filled_check == true
    false    
  end
  
  def checker(key, horizontal_start, horizontal_stop, vertical_start, vertical_stop, horizontal_move, vertical_move)
    for i in horizontal_start..horizontal_stop do
      for j in vertical_start..vertical_stop do
        if @container[i][j] == key && @container[i+(horizontal_move)][j+(vertical_move)] == key && @container[i+(horizontal_move*2)][j+(vertical_move*2)] == key && @container[i+(horizontal_move*3)][j+(vertical_move*3)] == key
          return true
        end
      end
    end
    false  
  end
  
  def display_container
    system 'clear'
    puts "             Welcome to Connect Four!!!!!!"
    puts  ""
    puts  ""
    puts  ""  
    puts "    1       2       3       4       5       6       7    "
    i = 5
    begin 
      puts "   | ( #{@container[0][i]} ) | ( #{@container[1][i]} ) | ( #{@container[2][i]} ) | ( #{@container[3][i]} ) | ( #{@container[4][i]} ) | ( #{@container[5][i]} ) | ( #{@container[6][i]} ) |"
      puts "  ------------------------------------------------------" 
      i -=1 
    end until i<0
    puts  ""
    puts  ""
    puts  "" 
  end
  
  def intake_loop(player_marker)
    success = false
    until success == true
      p "pick a column"
      input = gets.chomp
      success = intake_move(input, player_marker)
    end 
  end
  
  def play
    42.times do
      display_container    
      p "Player 1's turn"
      intake_loop("1")
      
      return if game_over_check("1") == true
      display_container   
      p "Player 2's turn"
      intake_loop("2")
      return if game_over_check("2") == true
    end 
  end
  
end 



  #def horizontal_check(key)
  #  for i in 0..3 do #horizontal
  #    for j in 0..5 do #vertical
  #      if @container[i][j] == key && @container[i+1][j] == key && @container[i+2][j] == key && @container[i+3][j] == key
  #        return true
  #      end
  #    end
  #  end
  #  false        
  #end
  
  #def vertical_check(key)
  #  for i in 0..4 do #horizontal
  #    for j in 0..5 do #vertical
  #      if @container[i][j] == key && @container[i][j+1] == key && @container[i][j+2] == key && @container[i][j+3] == key
  #        return true
  #      end
  #    end
  #  end
  #  false 
  #end
  #
  #def diagonal_check(key)
  #  for i in 0..3 do #horizontal
  #    for j in 0..2 do #vertical
  #      if @container[i][j] == key && @container[i+1][j+1] == key && @container[i+2][j+2] == key && @container[i+3][j+3] == key
  #        return true
  #      end
  #    end
  #  end
  #  for i in 3..6 do #horizontal
  #    for j in 0..2 do #vertical
  #      if @container[i][j] == key && @container[i-1][j+1] == key && @container[i-2][j+2] == key && @container[i-3][j+3] == key
  #        return true
  #      end
  #    end
  #  end
  #  false    
  #end
  


