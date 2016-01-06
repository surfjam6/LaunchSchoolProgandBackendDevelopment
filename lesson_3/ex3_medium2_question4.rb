# ex3_medium2_question4.rb 
## break up the following string and 
## put it back together with the words in reverse order:
sentence = "Humpty Dumpty sat on a wall."

sentence_array = sentence.chop.split


# reverse_sentence = []
# sentence_array.reverse_each do |x| 
#  reverse_sentence << x
# end
## only need:
reverse_sentence = sentence_array.reverse!

p reverse_sentence.join(" ") + "."
