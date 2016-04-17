require 'pry'

class Node
  attr_accessor :value, :left_child, :right_child, :left_parent, :right_parent    
end

class Tree
  attr_accessor :top
  def initialize(number)
    @top = Node.new
    @top.value = number
  end
  
  def crawl(number, node)   
   exit = false
   position = node
   return position if position.left_child.nil? == true && position.value >= number || position.right_child.nil? == true && position.value < number
   while exit == false do
     if position.value <= number && position.right_child.nil? == true   
       exit = true
       return position
     elsif position.value > number && position.left_child.nil? == true  
       exit = true
       return position
     elsif position.value <= number && position.right_child.value.class == Fixnum
       position = position.right_child
     elsif position.value > number && position.left_child.value.class == Fixnum
       position = position.left_child
     end       
   end
   position
  end   
  
  def assess(number, node)
    if node.value <= number
      node.right_child = Node.new
      return node.right_child
    else
      node.left_child = Node.new
      return node.left_child
    end
  end
  
  def add_node(number)
    position = crawl(number, @top)
    new_node = assess(number, position)
    new_node.value = number
  end 
end

array = [13 , 5, 34, 3, 8, 21, 55, 1, 144, 0, 2, 89, 233]

def build_tree(array)
  list = array.dup
  tree = Tree.new array[0]
  list.each do |number|
    tree.add_node(number) unless number == array[0]
  end
  tree  
end

def test_build_tree
  p "doing test for test_build_tree method"
  p '______________________________________'
  p build_tree_test.top.left_child.left_child.left_child.value # => 
  p build_tree_test.top.left_child.right_child.value # => 
  p build_tree_test.top.right_child.right_child.value # => 
  p build_tree_test.top.right_child.right_child.right_child.value # => 
  p '______________________________________'
end

def create_script
  test = Tree.new(13)
  test.add_node(34) # => 
  test.add_node(21) # => 
  test.add_node(5) # => 
  test.add_node(3) # => 
  test.add_node(8) # => 
  test.add_node(1) # => 
  test.add_node(2) # => 
  test.add_node(21) # => 
  test.add_node(55) # => 
  test.add_node(144) # => 
  test.add_node(89) # => 
  test.add_node(233) # => 
  
  p test.top.left_child.left_child.left_child.value
  p test.top.left_child.right_child.value # => 
  p test.top.right_child.right_child.value # => 
  p test.top.right_child.right_child.right_child.value
  test
end

def breadth_first_search(tree, figure)
  completed = Array.new #values that have been checked/reached  
  #top node, left child (add to queue), right child (add to cue), left-childs' left and right (both add to cue)
  #until queue is empty
  queue = [tree.top.dup]
  until queue.empty? == true do
    #binding.pry
    if queue[0] == nil
      queue.shift
    elsif queue[0].value == figure 
      return queue[0]
      #binding.pry
      queue.shift      
    else 
      queue << queue[0].left_child unless queue[0].nil? == true 
      queue << queue[0].right_child unless queue[0].nil? == true
      #binding.pry
      queue.shift
    end
  end  
end

def depth_first_search(tree, figure)
  result = Array.new #visited items
  stack = Array.new
  
end

build_tree_test = build_tree(array)
test = create_script
#binding.pry
puts "doing breadth first search"
p '______________________________________'
p breadth_first_search(build_tree_test, 455)
p breadth_first_search(test, 455)
p '______________________________________'
p "doing depth first search without recursion"
p '______________________________________'

p '______________________________________'
p "doing depth first search using recursion"
p '______________________________________'

p '______________________________________'
