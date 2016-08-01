# require gems
require 'sinatra'
require 'sinatra/reloader'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end

get '/students/new' do
  erb :new_student
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

# Search for students by campus using list of campuses in database
get '/campuses/search' do
	@campuses = db.execute("SELECT * FROM campuses")
	erb :campus_search
end

# Add a new campus
	# (Can add more functionality, e.g. check for duplicates)
post '/campuses/search' do
  db.execute("INSERT INTO campuses (city, abbreviation) VALUES (?,?)", [params['city'].capitalize, params['abbreviation'].upcase])
	redirect '/campuses/search'
end

# Print list of students at specific campus
get '/campuses' do
	campus = params[:campus]
	@campus_name = db.execute("SELECT city FROM campuses WHERE abbreviation=?", [campus])
	p @campus_name
	@students = db.execute("SELECT * FROM students WHERE campus=?", [campus])

	erb :campuses
end

# add static resources