# ex3_medium2_question1.rb
# Figure out the total age of just the male members of the family:
munsters = { 
  "Herman" => { "age" => 32, "gender" => "male" }, 
  "Lily" => { "age" => 30, "gender" => "female" }, 
  "Grandpa" => { "age" => 402, "gender" => "male" }, 
  "Eddie" => { "age" => 10, "gender" => "male" } 
}

total = 0
munsters.each do |key, value|
  if value["gender"] == "male"
    total = total + value["age"]
  end
end

puts "Total age of males is #{total}"