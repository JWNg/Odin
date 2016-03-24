module Enumerable
  def my_each
   i = 0
   while i <(self.length)
     yield(self[i])
     i +=1
   end
   self
  end
    
  def my_each_with_index
    i = 0
    while i <(self.length)
      yield(self[i], i)
      i+=1
    end  
    self    
  end
  
  def my_select
    i = 0
    new = Array.new             # => 
    while i <(self.length)      # => 
      new << self[i] if yield(self[i]) == true # => 
      i+=1
    end
    new
  end
  
  def my_all?
    i = 0
    if yield(self[i]) == true 
      i+=1 
      if i = self.length 
        return true
      end
    else 
      return false
    end    
  end
  
  def my_any?
    i = 0
    while i < self.length do
      if yield(self[i]) == true
        return true
      else
        i+= 1
      end
    end
    return false    
  end
  
  def my_none?
    i = 0
    while i < self.length do
      if block_given?
        if yield(self[i]) == true  
          return false
        else
          i+=1
        end
      elsif self[i] == true
        return false
      else
        i+=1        
      end
    end
    return true
  end
  
  def my_count(number=nil) 
    i = 0
    count = 0    
    while i < self.length do
      if block_given?
        if yield(self[i]) == true
          count +=1
          i +=1
        else
          i +=1
        end        
      elsif number.nil?
        return self.length
      else 
        if number == self[i]
          count +=1
          i+=1          
        else
          i+=1
        end
      end          
    end
    return count    
  end
  
  #def my_count(num = nil)
  #    c = 0
  #    if block_given?
  #      my_each { |i| c += 1 if yield(i) }
  #    elsif num.nil?
  #      c = length
  #    else
  #      my_each { |i| c += 1 if i == num }
  #    end
  #    c
  #  end
  
  def my_map
    i = 0
    if self.kind_of?Range
      new = self.to_a
    else
      new = self
    end
    while i < new.size
      new[i] = yield(new[i])
      i+=1
    end
    return new    
  end
  
  #def my_inject(n=nil)
  #  
  #end
  #
  #def multiply_els(list)
  #
  #end

  def my_map_proc
    
  end
end


puts "===================="
def Array
  include Enumerable
end

def Hash
  include Enumberable
end


puts "=========="

array = ["first",'second',"third"]
numbers_array = [1,2,3,4,5]
#p array  
hash = { a: 1, b: 2, c: 3, d: 4, e: 5} # => 
#p hash

#
#p "my_each"
#puts "=========="
#p array.each {|item| puts "here is #{item} " } # => 
#p hash.each {|key, value| puts "here is key #{key} and #{value}"} # => 
#p "----------"
#p array.my_each {|item| puts "here is #{item} from my_each" } # => 
#p hash.my_each {|key, value| puts "here is key #{key} and #{value} from my_each"} # => 
#puts "=========="
#p "each_with_index"
#puts "=========="
#p array.each_with_index {|object, i| puts "here is #{object} and index of #{i} from each_with_index" } # => 
#p "----------"
#p array.my_each_with_index {|object, i| puts "here is #{object} and index of #{i} from my_each_with_index" } # => 
#puts "=========="
#p "select"
#puts "=========="
#p array.select {|object| object[0]=="f" } # => 
#p numbers_array.select{|object| object.even?}
#p "----------"
#p array.my_select {|object| object[0]=="f" } 
#p numbers_array.my_select{|object| object.even?} 
#p "=========="
#p "all?"
#p "=========="
#p array.all?{|object| object.length >= 3}
#p array.all?{|object| object.kind_of?String } 
#p array.all?{|object| object.kind_of?Fixnum }
#p numbers_array.all?{|object| object.kind_of?Fixnum} 
#p "----------"
#p array.my_all?{|object| object.length >= 3}
#p array.my_all?{|object| object.kind_of?String } 
#p array.my_all?{|object| object.kind_of?Fixnum }
#p numbers_array.my_all?{|object| object.kind_of?Fixnum} 
#p "=========="
#p "any?"
#p "=========="
#p array.any? {|word| word.length >=3}
#p numbers_array.any?{|number| number >=5}
#p numbers_array.any?{|number| number ==6}
#p "=========="
#p array.my_any? {|word| word.length >=3}
#p numbers_array.my_any?{|number| number >=5}
#p numbers_array.my_any?{|number| number ==6}
#p "=========="
#p "none?"
#p "=========="
#p %w{ant bear cat}.none? { |word| word.length == 5 } 
#p %w{ant bear cat}.none? { |word| word.length >= 4 } 
#p [].none?                                           
#p [nil].none?                                        
#p [nil, false].none?                                 
#p [nil, false, true].none?   
#p "----------"                        
#p %w{ant bear cat}.my_none? { |word| word.length == 5 } 
#p %w{ant bear cat}.my_none? { |word| word.length >= 4 } 
#p [].my_none?                                           
#p [nil].my_none?                                        
#p [nil, false].my_none?                                 
#p [nil, false, true].my_none?   
#p "----------"        
#p "=========="
#p "count"
#p "=========="
#p ary = [1, 2, 4, 2]
#p ary.count               #=> 4
#p ary.count(2)            #=> 2
#p ary.count{ |x| x%2==0 } #=> 3 
#p "----------"  
#p ary = [1, 2, 4, 2]
#p ary.my_count               #=> 4
#p ary.my_count(2)            #=> 2
#p ary.my_count{ |x| x%2==0 }
# p "=========="
# p "map"
# p "=========="
# p (1..4).map { |i| i*i }      #=> [1, 4, 9, 16]
# p "----------" 
# p (1..4).my_map { |i| i*i } 

 p "=========="
 p "inject"
 p "=========="

p (5..10).inject(:+)                             #=> 45
 # Same using a block and inject
p (5..10).inject { |sum, n| sum + n }            #=> 45
 # Multiply some numbers
p (5..10).inject(1, :*)                          #=> 151200
 # Same using a block
p (5..10).inject(1) { |product, n| product * n } #=> 151200
 # find the longest word
longest = %w{ cat sheep bear }.inject do |memo, word|
   memo.length > word.length ? memo : word
end
p longest                                        #=> "sheep"
p "----------" 

#p (5..10).my_inject(:+)                             #=> 45
 # Same using a block and inject
p (5..10).my_inject { |sum, n| sum + n }            #=> 45
 # Multiply some numbers
#p (5..10).my_inject(1, :*)                          #=> 151200
 # Same using a block
p (5..10).my_inject(1) { |product, n| product * n } #=> 151200
 # find the longest word
longest = %w{ cat sheep bear }.my_inject do |memo, word|
   memo.length > word.length ? memo : word
end
p longest                                        #=> "sheep"
p "----------" 
