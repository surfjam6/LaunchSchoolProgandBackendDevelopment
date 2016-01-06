# ex3_hard1_question5.rb

## to determine if an input string is an 
## IP address representing dot-separated numbers. e.g. "10.4.5.11". 

def dot_separated_ip_address?(input_string)
  ip_address = "false"  # return false unless found to be true
  dot_separated_words = input_string.split(".")

  if dot_separated_words.size != 4
  else # check each section is a number:
    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      is_number = "true" ## used to substitute for testing instead of is_nember?
      break if is_number != "true"
      ip_address = "true"
    end
  end
  p ip_address
end
puts "\n"
dot_separated_ip_address?("10.4.5.11")
dot_separated_ip_address?("10.4.5.a")
dot_separated_ip_address?("10.4.5.11.11")
dot_separated_ip_address?("10.4.")
dot_separated_ip_address?("10.4.5")