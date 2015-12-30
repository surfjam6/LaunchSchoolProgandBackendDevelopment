# ex3_question6.rb 
## how could we easily center that title above the table with spaces?
## If we had a 40 character wide table of Flintstone family members
title = "Flintstone Family Members"

TABLE_WIDTH = 40
p leading_spaces = (TABLE_WIDTH - (title.index "s", -1))/2

# Answer:
title.center(40)