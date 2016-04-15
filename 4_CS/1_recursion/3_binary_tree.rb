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
   #binding.pry
   return position if position.left_child.nil? == true && position.value >= number || position.right_child.nil? == true && position.value < number
   while exit == false do
     #binding.pry
     if position.value <= number && position.right_child.nil? == true  
       #binding.pry     
       exit = true
       return position
     elsif position.value > number && position.left_child.nil? == true 
       #binding.pry      
       exit = true
       return position
     elsif position.value <= number && position.right_child.value.class == Fixnum
       #binding.pry
       position = position.right_child
     elsif position.value > number && position.left_child.value.class == Fixnum
       #binding.pry
       position = position.left_child
     end       
   end
   position
   #binding.pry
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
    #binding.pry
    new_node = assess(number, position)
    new_node.value = number
    #binding.pry
  end  
  
  def build_tree
    tree
  end  
end
