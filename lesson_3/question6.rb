# question6.rb
## how two different ways to put the expected "Four score and " in front of it.

famous_words = "seven years ago..."

famous_words = "Four score and " + famous_words
p famous_words
puts "\n"

famous_words = "seven years ago..."
famous_words = "Four score and " << famous_words
p famous_words
puts "\n"

famous_words = "seven years ago..."
famous_words.sub!("seven", "Four score and seven")
p famous_words

famous_words = "seven years ago..."
famous_words.push("Four score and ")
p famous_words

