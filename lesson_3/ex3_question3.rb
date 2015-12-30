# ex3_question3.rb
# How can we add multiple items to our array? (Dino and Hoppy)

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino" << "Hoppy"
p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones += ["Dino","Hoppy"]
p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
add_array = ["Dino","Hoppy"]
flintstones.push *add_array
p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
add_array = ["Dino","Hoppy"]
flintstones.concat(add_array)
p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
add_array = ["Dino","Hoppy"]
flintstones += add_array
p flintstones

