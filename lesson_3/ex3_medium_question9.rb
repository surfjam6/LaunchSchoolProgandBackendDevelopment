# ex3_medium_question9.rb
## Note: a kid is in the age range 0 - 17, 
## an adult is in the range 18 - 64 and a senior is aged 65+
## hint: try using a case statement along with Ruby Range objects
## { "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },

munsters = { 
  "Herman" => { "age" => 32, "gender" => "male" }, 
  "Lily" => { "age" => 30, "gender" => "female" }, 
  "Grandpa" => { "age" => 402, "gender" => "male" }, 
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.keys.each do |key|
  value = munsters[key]["age"]
#   print "key: #{key}, value: #{value}\n"
  # use key, value  as desired
  case value
   when 1..17 then munsters[key].merge!("age_group" => "kid")
   when 18..64 then munsters[key].merge!("age_group" => "adult")
   when 65..200 then munsters[key].merge!("age_group" => "senior")
   else  puts "#{key}, #{value} has INVALID AGE!!\n\n"
  end
end

p munsters
