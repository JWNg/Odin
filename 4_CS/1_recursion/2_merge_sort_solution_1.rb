#end
#
#if array1.length > counter_1 && array2.length > counter_2  
#  if array1[counter_1]>= array2[counter_2]
#    array << array2[counter_2]
#    counter_2 +=1
#  else
#    array<< array1[counter_1]
#    counter_1 +=1
#  end          
#elsif array1.length >counter_1
#  array << array1[counter_1]
#  counter_1 +=1      
#elsif array2.length > counter_2 
#  array << array2[counter_2]
#  counter_2 +=1    
#end

array = [25, 6, 9, 0, -5, 1, 3, 12]
def merge(array1, array2)
  #counter_1, counter_2 = 0,0
  array = Array.new
  while array1.length > 0 && array2.length > 0 do
    if array1[0] <= array2[0]
      array <<array1.shift
    else array2[0] < array1[0]
      array << array2.shift
    end    
  end  
  array1.length == 0 ? array2.each{|number| array<<number} : array1.each{|number| array<<number}   
  array    
end



def merge_sort(array)
  length = array.size   
  return array if array.size == 1
  a = array[0..length/2-1]
  b = array[length/2.. -1]
  sorted_a = merge_sort(a)
  sorted_b = merge_sort(b) 
  p merge(sorted_a, sorted_b)
end





merge_sort(array) # => [-5, 0, 1, 3, 6, 9, 12, 25]

# >> [6, 25]
# >> [0, 9]
# >> [0, 6, 9, 25]
# >> [-5, 1]
# >> [3, 12]
# >> [-5, 1, 3, 12]
# >> [-5, 0, 1, 3, 6, 9, 12, 25]
