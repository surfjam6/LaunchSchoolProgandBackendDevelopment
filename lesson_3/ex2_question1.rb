# ex2_question1.rb
## see if there is an age present for "Spot".

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.fetch("Spot", "Spot not Found")

ages.include?("Spot")
ages.value?("Spot")
ages.member?("Spot")
