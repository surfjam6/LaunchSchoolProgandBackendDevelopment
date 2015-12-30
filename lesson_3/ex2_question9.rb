# ex2_exercise9.rb

## Using array#map!, shorten each of these names to just 3 characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each do |i|
  while i.length > 3
    i.chop!
  end
end
p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map! do |name|
#  puts name[0]
  name[0, 3]
end
p flintstones

