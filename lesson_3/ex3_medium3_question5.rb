# ex3_medium3_question5.rb

def color_valid(color)
  choices = ["blue", "green"]
  if choices.include?(color)
    true
  else
    false
  end
end

def shorter_color_valid(color)
  color == "blue" || color == "green"
end
p color_valid("blue")
p color_valid("red")
p color_valid("green")
puts "Shorter\n"

p shorter_color_valid("blue")
p shorter_color_valid("red")
p shorter_color_valid("green")
