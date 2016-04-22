require 'spec_helper'
require 'Enumerable'

describe 'Enumerable module' do 
  
  describe 'my_each' do
      
    it 'will return each object in an array' do
      a = ["a", "b", "c", "d"]
      expect(a.each{|item| item}).to eq(a.my_each{|my_item| my_item})
    end  
    
  end
  
  describe 'my_each_with_index' do
    
    it 'will return each object with the index' do
      a = ["a", "b", "c", "d"].my_each_with_index do|item, index|
        "#{item} => #{index}"
      end
      b = ["a", "b", "c", "d"].my_each_with_index do|item, index|
        "#{item} => #{index}"
      end
      expect(a).to eq(b)
    end
    
  end
  
  describe 'my_select' do
    
    it 'will select Fixnum' do
      select = [1,2,3,4,5].select { |num|  num.even?  } 
      my_select = [1,2,3,4,5].my_select { |num|  num.even?  } 
      expect(my_select).to eq(select)
    end
    
    it 'will select strings' do
      a = %w{ a b c d e f }
      my_select = a.my_select { |v| v =~ /[aeiou]/ }
      expect(my_select).to eq(["a", "e"])      
    end
    
    it 'will recognize case sensitivity' do
      a = %w{ a b c d e f A E}
      my_select = a.my_select { |v| v =~ /[AEIOU]/ }
      expect(my_select).to eq(["A", "E"])    
      
    end
    
  end
  
  describe 'my_all?' do
    
    it 'will distinguish Fixnum values'do
      array = [1,2,3,4,5]
      returned = array.all?{|object| object >= 3}
      expect(returned).to eq(false)
    end
    
    
    it 'will distinguish object types' do
      numbers_array = [1,2,3,4,5]
      returned = numbers_array.all?{|object| object.kind_of?Fixnum} 
      expect(returned).to eq(true)
    end   
    
  end
  
  describe 'my_any?' do
  
    it 'will work with Fixnum' do
      numbers_array = [1,2,3,4,5].my_any?{|number| number>=5}
      expect(numbers_array).to eq(true)
    end    
    
    it 'will work string' do 
      array = ["first",'second',"third"].my_any?{|item| item.length>=3}
      expect(array).to eq(true)
    end
    
    it 'will work string' do 
      array = ["first",'second',"third"].my_any?{|item| item.length>=7}
      expect(array).to eq(false)
    end   
    
  end
  
  describe 'my_none?' do
    
    it 'will detect string' do
      affirm = %w{ant bear cat}.my_none? { |word| word.length == 5 }
      deny = %w{ant bear cat}.my_none? { |word| word.length >= 4 }
      expect(affirm).to eq(true)
      expect(deny).to eq(false)
    end    
    
    it 'will detect empty array' do
    empty = [].my_none?  
    expect(empty).to eq(true)
    end
    
    it 'will detect nil' do
    nil_detect = [nil].my_none? 
    expect(nil_detect).to eq(true)
    end
    
    it 'will detect false' do
      false_test = [nil, false].my_none?   
      expect(false_test).to eq(true)
    end
    
    it 'will detect 1 true statement as sufficient' do
      true_sufficiency = [nil, false, true].my_none?
      expect(true_sufficiency).to eq(false)      
    end
        
  end
      
end
