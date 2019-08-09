# Test out your code here in console
require 'pry'
require 'require_all'

require_all '../05-code-challenge-review'

hamilton = Musical.new("Hamilton", "NYC")
cats = Musical.new("Cats", "NYC")
wicked = Musical.new("Wicked", "Seattle")

paramount = Theater.new("Paramount", "Seattle")
seattle_rep = Theater.new("Seattle Rep", "Seattle")
crocodile = Theater.new("Crocodile", "Seattle")
dizzys = Theater.new("Dizzys", "NYC")

performance1 = Performance.new("2019-09-09", hamilton, dizzys)


binding.pry
0
