# ex3_medium_question6.rb

## This implementation modifies the "buffer" which is input 
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

## This implementation does not modify the buffer, 
## I think it could if buffer was passed in as a parameter but this
## implementation is slower because it requires an addition operation
## "+=" ex: x = x + new

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size >= max_buffer_size
  buffer
end

## What if you called as follows:
buffer = rolling_buffer2(buffer, max_buffer_size, new_element)
## would this be the same as << ?
## Yes:
## In irb:
buffer = []
buffer = rolling_buffer2(buffer, 3, "Bob")
2.2.1 :010 > buffer
 => ["Bob"] 
 2.2.1 :011 > buffer = rolling_buffer2(buffer, 3, "Joe")
 => ["Bob", "Joe"] 
2.2.1 :012 > buffer
 => ["Bob", "Joe"] 
 2.2.1 :013 > buffer = rolling_buffer2(buffer, 3, "Sue")
 => ["Joe", "Sue"] 
2.2.1 :014 > buffer
 => ["Joe", "Sue"] 