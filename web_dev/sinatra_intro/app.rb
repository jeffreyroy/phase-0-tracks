# require gems
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  response = ""
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  response
end

get '/contact' do
  "Sherlock Holmes<br>
  221b Baker Street<br>
  London NW1 6XE<br>
  United Kingdom<br>"
end

get '/great_job' do
  name = params[:name]
  response = "Good job"
  if name
    response << ", #{name}"
  end
  response << "!"
  response
end

get '/add/:x/:y' do
  x = params[:x].to_i
  y = params[:y].to_i
  "#{x} + #{y} = #{x+y}"
end

get '/search' do
  "<form action='result'>
  <p>Search for a student by name:</p>
  <p>Full name:
  <input type='text' name='name' />
  </p>"
end

get '/result' do
  name=params[:name]
  students = db.execute("SELECT * FROM students WHERE name=?", name)
  if students.empty?
    "No students found with that name."
  else
    response = ""
    students.each do |student|
      response << "ID: #{student['id']}<br>"
      response << "Name: #{student['name']}<br>"
      response << "Age: #{student['age']}<br>"
      response << "Campus: #{student['campus']}<br><br>"
    end
    response
  end
end
