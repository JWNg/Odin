require 'jumpstart_auth'

class MicroBlogger
  attr_reader :client

  def initialize
    puts "Initializing MicroBlogger"
     @client = JumpstartAuth.twitter
  end
  
  def tweet(message)
     @client.update(message)
  end
  
  def run
     puts "Welcome to the JSL Twitter Client!"
     command = ""
     while command != "q"
       printf "enter command: "
       inputs = gets.chomp
       parts = inputs.split(' ')
       command  = parts[0]
       case command
         when 'q' then puts "Goodbye!"
         when 't' then tweet(parts[1..-1].join(" "))
         when 'dm' then dm(parts[1], parts[2..-1].join(" "))     
         else
           puts "Sorry, I don't know how to #{command}"
        end
     end
   end
   
   def dm(target, message)
     puts "Trying to send #{target} this direct message:"
     puts message
     message = "d @#{target} #{message}"
     tweet(message)
   end
end

blogger = MicroBlogger.new
blogger.run
