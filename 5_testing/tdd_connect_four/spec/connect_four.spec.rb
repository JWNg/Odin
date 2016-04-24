require 'Connect_four'
require 'pry'

describe Connect_four do
  
  connect_four = Connect_four.new
  
  describe '#initialize' do
    
    it 'creates 1 array containing 7 arrays' do
      array_of_seven_arrays = [[],[],[],[],[],[],[]]
      expect(Connect_four.new.container).to eq(array_of_seven_arrays)
    end
  end
  
  describe '#intake_move' do
    
    it 'updates input into container array' do
      connect_four.intake_move(1)    
      expect(connect_four.container[0][0]).to eq("X") 
    end 
    
    it 'will not add more than 6 inside a column' do
      7.times{connect_four.intake_move(1)}
      expect(connect_four.container[0][7]).to eq(nil)
    end
    
  end
  
  describe '#game_over_check' do
    it 'recognizes when 4 markers are connected' do
      4.times {connect_four.container[0] << "X"}
      expect(connect_four.game_over_check("X")).to eq(true)
    end    
  end
  
  describe '#filled_check'
  
  describe '#intake_loop'
  
  describe '#checker'

end


