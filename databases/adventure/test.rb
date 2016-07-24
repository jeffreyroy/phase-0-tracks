# OPERATION KITTEN EXPLOSION!

# talk about Object Relational Mapping (ORM)

# require gems
require 'sqlite3'

# create SQLite3 database
db = SQLite3::Database.new("kittens.db")
db.results_as_hash = true

# create a kittens table (if it's not there already)
test = db.execute("SELECT * FROM kittens")
a = test.index { |x| x["name"]=="Garfield"}
p test
p a
p test[a]["name"]




# explore ORM by retrieving data
# kittens = db.execute("SELECT * FROM kittens")
# kittens.each do |kitten|
#  puts "#{kitten['name']} is #{kitten['age']}"
# end

