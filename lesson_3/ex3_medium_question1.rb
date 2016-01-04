# ex3_medium_question1.rb
## write a one-line program that creates the following output 10 times,
## with the subsequent line indented 1 space to the right:

statement = 'The Flintstones Rock!'

0.upto(9) { |i| puts statement.rjust (statement.length + i) }

# Answer:
10.times { |number| puts (" " * number) + "The Flintstones Rock!" }