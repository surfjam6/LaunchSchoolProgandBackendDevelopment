# ex3_hard1_question4.rb
require 'securerandom'

def uuid
## random_string = [*('a'..'f'),*('0'..'9')].shuffle[0,8].join
  random_string = SecureRandom.hex.split(//)
  random_string[0..7].join + '-' + random_string[8..11].join + '-' + random_string[12..15].join + '-' + random_string[16..19].join + '-' + random_string[20..31].join
end

## another approach to generate a random string:
def random_string2(str_length=4)
  chars = 'abcdef0123456789'
  password = ''
  str_length.times { password << chars[rand(chars.length)] }
  password
end

def uuid2
  select = [8,4,4,4,12]
  select_end = select.last
  string = ''
  uuid = ''
  select.each do |x|
    uuid << string
    string = random_string2(x) + '-' 
  end
  string = random_string2(select.last)
  uuid << string
end
p uuid
p uuid2