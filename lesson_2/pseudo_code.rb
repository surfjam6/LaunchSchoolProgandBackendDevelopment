## write out pseudo-code (both casual and formal) that does the following:

# a method that returns the sum of two integers
casual:
 - input integer1, integer2
 - compute/return sum
 
formal:
START
Given two integers

SET integer1 
SET integer2

sum = add integer1 add integer2

PRINT sum

## a method that takes an array of strings, 
# and returns a string that is all 
# those strings concatenated together
casual:
- input array of strings
- concatenate strings
- print single string

formal:
START

given array of strings

SET result_string to nil

WHILE not end of array
  concatenate each string into result
END

PRINT result_string

# a method that takes an array of integers, 
# and returns a new array with every other element
##Note - clarify whether to start with first or second element ??
## Will assume start with first element
casual:
- given array of integers
- set count to 0
- iterate over array |index|
   new_array = new_array add array[index%2]
- print new_array

formal:
START
given array of integers
SET count to 0
SET new_array nil

WHILE not end of array
- if odd element add to new_array
END

PRINT new_array


