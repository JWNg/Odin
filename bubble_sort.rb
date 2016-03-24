
list = [5,4,3,2,1]

def bubble_sort(list)
  cycle = 0
  while cycle < list.length-1 do
    n = 0
    while n < list.length-1 do
    change = list[n] <=> list[n+1]
      if change == 1
        list[n], list[n+1] = list[n+1], list[n]
        p list 
        n +=1
        next
      else
        p list
        n +=1
        next    
      end
    end
    cycle +=1
  end   
end

list = [5,4,3,2,1]
puts bubble_sort(list) # => nil



#start at zero and as you go up you increment up to list.length, each time you up the times+1
#take the first 2 items and switch is 1 is <=> otherwise keepm, than iterate to new with n+1 
#to next pair for a total of n = list.lenght
#than you iterate again (n.length)-1 times
# 
## 5,4,3,2,1
##43215
#32145
#21345
#12345
#cycle = 1
#n = 0
#list[n], list[n+1] = list[n+1], list[n] # => [4, 5]
#p list # => [4, 5, 3, 2, 1]
#n +=1 # => 1
#list[n], list[n+1] = list[n+1], list[n] # => [3, 5]
#p list # => [4, 3, 5, 2, 1]
#n +=1 # => 2
#list[n], list[n+1] = list[n+1], list[n] # => [2, 5]
#p list # => [4, 3, 2, 5, 1]
#n +=1
#list[n], list[n+1] = list[n+1], list[n] # => [1, 5]
#p list # => [4, 3, 2, 1, 5]
#n +=1
# >> [4, 5, 3, 2, 1]
# >> [4, 3, 5, 2, 1]
# >> [4, 3, 2, 5, 1]
# >> [4, 3, 2, 1, 5]
# >> [3, 4, 2, 1, 5]
# >> [3, 2, 4, 1, 5]
# >> [3, 2, 1, 4, 5]
# >> [3, 2, 1, 4, 5]
# >> [2, 3, 1, 4, 5]
# >> [2, 1, 3, 4, 5]
# >> [2, 1, 3, 4, 5]
# >> [2, 1, 3, 4, 5]
# >> [1, 2, 3, 4, 5]
# >> [1, 2, 3, 4, 5]
# >> [1, 2, 3, 4, 5]
# >> [1, 2, 3, 4, 5]
# >> 
