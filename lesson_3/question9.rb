# question9.rb
## Turn this into an array containing only two elements: 
## Barney's name and Barney's number

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones.each do |key, value|
  if key != "Barney"
    puts "#{key} => #{value}"
    flintstones.delete(key)
  end
end

p flintstones
flintstones = flintstones.flatten
p flintstones