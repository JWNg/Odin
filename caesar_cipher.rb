def caesar_cipher(string, shift=0)
  new_word = ""
  shift = shift.to_i
  string.each_char do|c| 
    shift.times do
      if c == "z"
        c = "a"
        next
      elsif c == "Z"
        c == "A"
        next
      else
        c.next!
      end
    end
    new_word << c
  end
  puts new_word
end

caesar_cipher("hey how are you", 2)
#split letters, into array, shift them n numbers
#n%26 = x is used for shift
