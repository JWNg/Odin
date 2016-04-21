
def caesar_cipher(string, shift=0)
  new_word = ""
  shift = shift.to_i
  string.each_char do|c|
     
    shift.times do
      if c == " "
        next      
      elsif c == "z"
        c = "a"
        next
      elsif c == "Z"
        c = "A"
        next
      else
        c.next!
      end
    end
    new_word << c
  end
  new_word
end

