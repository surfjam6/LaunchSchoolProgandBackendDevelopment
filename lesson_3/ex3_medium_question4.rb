# ex3_medium_question4.rb 

## What happens when we modify an array while we are iterating over it? 
## What would be output by this code?

## This shows that .each doesn't keep track of what is in the numbers array
## it iterates again blindly (after the .shift or .delete_at )
## 1
## [2,3,4] // numbers after shift(1)
## .each then iterates number again
## 3
## [3,4]


numbers = [1, 2, 3, 4]
numbers.each do |number|  
  p number
  numbers.pop  # pop is from right, shift from left
#  numbers.shift(1)
#  numbers.delete_at(0)
# numbers = [2, 3, 4]
  p numbers
end
