# ex3_hard1_question3B.rb

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts " I predict method won't change one, two , three values"
puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"