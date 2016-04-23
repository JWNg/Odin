require 'TTT_Mar_22_2016'



describe Board do 
  
  before(:example) do
    @board = Board.new
  end
  
  describe '#win_check'
  
    it "is invoked when winning combination occurs with matching symbol" do
      @board.squares[1], @board.squares[2], @board.squares[3] = "X","X","X"
      check_X = @board.win_check("X")
      check_O = @board.win_check("O")
      expect(check_X).to eq(true)
      expect(check_O).not_to eq(true)     
    end     
  
end


describe Game do
  
  before(:example) do
    @game = Game.new
  end
  
  describe '#unoccupied_positions' do
    
    it 'returns array if no positions are taken' do
      expect(@game.unoccupied_positions).to eq([1,2,3,4,5,6,7,8,9])
    end
    
    it 'returns empty array if all positions taken' do
      (1..9).each{|number| @game.board.squares[number] = "X" }
      expect(@game.unoccupied_positions).to eq([])
    end   
  end
  
  
  describe '#valid_move?' do
    
    before(:example)do
      (1..8).each{|number| @game.board.squares[number] = "X" }
    end
    
    it 'acceptable and unacceptable moves are recognized' do
      expect(@game.valid_move?(9)).to eq(true)
      expect(@game.valid_move?(1)).not_to eq(true)     
    end       
    
  end
  
  
  describe '#intake_move' do
    
    before(:example)do
      (1..8).each{|number| @game.board.squares[number] = "X" }
    end
    
    it 'updates board move holder' do
      @game.intake_move("O")
      expect(@game.board.squares[9]).to eq("O")
    end  
    
    it 'reasks the input until valid input' do
      #binding.pry
      @game.stub(:gets).and_return("20", "9")
      #binding.pry
      
      @game.intake_move("X")
      #binding.pry
      #@game.stub(:gets).and_return(9)
      expect(@game.board.squares[9]).to eq("X")
      
    end 

  end
    
end
