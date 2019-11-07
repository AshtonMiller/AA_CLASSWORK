# PHASE 2
def convert_to_int(str)
  begin 
  Integer(str)
  rescue ArgumentError => e
    puts "input of #{str} not recognized as integer"
    puts "Error was #{e.message}"
  end 

end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  begin
    puts FRUITS.index(maybe_fruit)   # needs to be fixed this is where we left off. 
  rescue StandardError => e
    if maybe_fruit == "coffee"
      puts "I love #{maybe_fruit}, got any fruit?"
      retry
    end 
    puts "I have never seen a #{maybe_fruit}"
    puts "#{e.message}"
  ensure
    puts "Thanks for coming by"
  end 

  # if FRUITS.include?(maybe_fruit)
  #   puts "OMG, thanks so much for the #{maybe_fruit}!"
  # else 
  #   raise StandardError 
  # end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


# def reaction(maybe_fruit)
#   begin
#     !FRUITS.include?(maybe_fruit)
#     puts "OMG, thanks so much for the #{maybe_fruit}!"
#   rescue StandardError => e
#     puts "i have never eaten #{maybe_fruit}"
#     puts "#{e.message}"
#   ensure
#     puts "thanks for the #{maybe_fruit}"
#   end 
# end
