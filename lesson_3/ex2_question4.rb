# ex2_question4.rb
## Convert the string in the following ways 
## (code will be executed on original munsters_description above):
## "The munsters are creepy in a good way."
## "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
## "the munsters are creepy in a good way."
## "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

munsters_description = "The Munsters are creepy in a good way."

munsters_description.downcase.sub("t", "T")
munsters_description.upcase.sub("T", "t").sub("M", "m")
munsters_description.downcase!
munsters_description.upcase!

##Answer:
munsters_description = "The Munsters are creepy in a good way."


munsters_description.capitalize!
munsters_description.swapcase!
munsters_description.downcase!
munsters_description.upcase!







