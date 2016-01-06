# ex3_hard1_question2.rb

greetings = {a: 'hi'}
informal_greeting = greetings[:a]
puts informal_greeting.object_id
puts greetings[:a].object_id
informal_greeting << " there"

puts informal_greeting
puts greetings

greetings = {a: 'hi'}
informal_greeting = greetings[:a].clone
puts informal_greeting.object_id
puts greetings[:a].object_id
informal_greeting = informal_greeting + ' there'
# informal_greeting << " there"  # this works too
# informal_greeting += " there" # this works too
puts informal_greeting
puts greetings
