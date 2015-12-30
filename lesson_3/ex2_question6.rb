# ex2_exercise6.rb
## Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

youngest = ages.sort_by {|_key, value| value}.to_h
p youngest.first[1]

# Answer:
p ages.values.min

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.each do |i|
  if i.start_with?("Be")
    p i.index
  end
end
