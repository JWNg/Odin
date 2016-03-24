list = ["hello", "hey", "hi", "horse"]
p list[0] # => "hi"
p list.length # => 4


def bubble_sort_by(list)
  loop = 0
  while loop < list.length-1 do
    placement = 0
    while placement < list.length-1 do
      if yield(list[placement], list[placement+1]) <1 
        placement +=1
      else 
        list[placement], list[placement+1] = list[placement+1], list[placement]
        placement+=1
      end
    end
    loop +=1 
  end
  return list
end

p bubble_sort_by(list) {|left, right| left.length - right.length }

# bubble_sort_by(["hi","hello","hey"]) do |left,right|
#   left.length - right.length
# end
# >> "hi"
# >> 4
