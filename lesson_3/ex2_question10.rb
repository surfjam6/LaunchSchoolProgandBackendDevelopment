# ex2_question10.rb

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! {|name| name[0, 3]}
p flintstones