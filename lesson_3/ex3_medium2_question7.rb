# ex3_medium2_question7.rb

def rps(fist1, fist2)
  if fist1 == 'rock'
    (fist2 == 'paper') ? 'paper' : 'rock'
  elsif fist1 == 'paper'
    (fist2 == 'scissors') ? 'scissors' : 'paper'
  else (fist2 == 'rock') ? 'rock' : 'scissors'
  end
  
end

# puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

puts rps("rock", "paper")
puts rps("rock", "scissors")

puts rps("paper", "rock")
puts rps(rps("rock", "paper"), rps("rock", "scissors"))
puts rps("paper", "rock")
