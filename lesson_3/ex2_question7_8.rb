# ex2_question7:
## See if the name "Dino" appears in the string below:

advice = "Few things in life are as important as house training your pet dinosaur."
advice.include?("Dino")

##Answer:
advice.match("Dino")

# ex2_question8:
## Find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# create hash to map names to index:
hash = Hash[flintstones.map.with_index.to_a]    

flintstones.each do |i|
  if i.start_with?("Be") # find first name starting with "Be"
    puts i
    p hash[i] # get index 
  end
end
