# ex2_question2.rb
## Add up all of the ages from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

age_total = 0

ages.each_value do |value|
#  puts value
  age_total = age_total + value
end
puts age_total