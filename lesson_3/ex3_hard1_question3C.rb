# ex3_hard1_question3C.rb

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

## This won't work:
# one = one
# two = two
# three = three

mess_with_vars(one, two, three)

puts "I predict gsub! will mutate one, two and three"
puts "one is: #{one}"
puts "two is: #{two}"
puts "three is: #{three}"