require 'pry'

def fibs(n)
  first, second = 0, 1
  n.times do|n|
    print "#{first} "   
    first, second = second, (first+second)   
  end  
end

fibs(12) # => 12
 
def fibs_rec(n)
  return 0    if n == 1
  return 1   if n == 2       
  return fibs_rec(n-2)+fibs_rec(n-1)  
end

fibs_rec(10) # => nil

# >> 0 1 1 2 3 5 8 13 21 34 55 89 34
