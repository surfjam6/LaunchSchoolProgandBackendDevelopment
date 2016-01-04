# ex3_medium_question8.rb

## titleize! This method in Ruby on Rails 
## creates a string that has each word capitalized as it would be in a title.

## Titleize examples:
# 'man from the boondocks'.titleize   # => "Man From The Boondocks"
# 'x-men: the last stand'.titleize    # => "X Men: The Last Stand"

def prompt(message)
  puts "=> #{message}"
end

def titleize(string)
   split_string = string.split
   split_string.each do |x| 
     x.capitalize!
   end
   p split_string.join(' ')
end

string =  'man from the boondocks'

titleize(string)
titleize ('x-men: the last stand')
