# ex3_medium_question2.rb
## Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

statement_hash = {}
# statement_hash = { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2}
statement.each_char do |letter|
  if statement_hash.has_key?(letter)
    statement_hash[letter] += 1
  else
    statement_hash[letter] = 1
  end
end
p statement_hash
