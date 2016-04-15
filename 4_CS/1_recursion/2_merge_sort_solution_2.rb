array = [25, 6, 9, 0, -5, 1, 3, 12]



def merge_sort(array)
  length = array.size   
  return array if array.size == 1
  a = array[0..length/2-1]
  b = array[length/2.. -1]
  array1 = merge_sort(a)
  array2 = merge_sort(b) 
  
  array3 = Array.new
  while array1.length > 0 && array2.length > 0 do
    if array1[0] <= array2[0]
      array3 <<array1.shift
    else array2[0] < array1[0]
      array3 << array2.shift
    end    
  end  
  array1.length == 0 ? array2.each{|number| array3<<number} : array1.each{|number| array3<<number}   
  array3 
end





merge_sort(array) # => [-5, 0, 1, 3, 6, 9, 12, 25]
