#DHRSurvey by Jesus Ramirez
#for Web Engineer Application

#Required for sinatra and data mapper entries
require "sinatra"
require 'data_mapper'

#Database setup
if ENV['DATABASE_URL']
  DataMapper::setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/mydb')
else
  DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/app.db")
end

#Patient Data class
class PatientInfo
	include DataMapper::Resource
	property :pat_id, Serial												#Object ID
	property :pat_first, Text												#Contains Patients First Name
	property :pat_last, Text												#Contains Patients Last Name
	property :pat_phone, Integer											#Patients Phone #
	#property :pat_rating, Integer, :default =>0		#Contains patients visit rating (for linking to survey input if needed)
	property :survey_date, Date								#Date and time of submission
	property :current, Boolean, :default => false
end

#Ratings Class
class Ratings
	include DataMapper::Resource
	property :rating_id, Serial											#Object ID
	#property :user_id, Integer											#Surveys should be annonymous but can be linked to patientID if needed.
	property :rating1, Integer, :default => 0				#Rating 1-3 (1 = Bad, 2 = Neutral, 3 = Good)
	property :rating2, Integer, :default => 0				#Rating 1-3 (1 = Bad, 2 = Neutral, 3 = Good)
	property :rating3, Integer, :default => 0				#Rating 1-3 (1 = Bad, 2 = Neutral, 3 = Good)
	property :rating4, Integer, :default => 0				#Rating 1-3 (1 = Bad, 2 = Neutral, 3 = Good)
	property :rating5, Integer, :default => 0				#Rating 1-3 (1 = Bad, 2 = Neutral, 3 = Good)
end

#Database finalize
DataMapper.finalize
PatientInfo.auto_upgrade!
Ratings.auto_upgrade!

# Homepage/Gets information for new survey entry
get "/" do
	erb :index
end

# Creates database entries after user input
post "/new_survey/create" do
	#if user phone# already in database reject survey and inform user feedback had already been received
	m = PatientInfo.all()

	# Look through each patient submissions
	m.each do |c|
		c.update(:current => false) 									#reset found booleans back to false

		if c.pat_phone.to_s == params["pat_phone"]		#if phone number is found in database means already submitted
			c.update(:current => true)									#boolean to found (will use this in html to show date)
			redirect "/survey_completed"								#send to already submitted page
		end
	end

	#if user information not stored save and submit
	u = PatientInfo.new
		u.pat_first = params["first"]
		u.pat_last = params["last"]
		u.pat_phone = params["pat_phone"]
		u.survey_date = Time.now
		u.save
	b = Ratings.new
		b.rating1 = params["rating1"].to_i
		b.rating2 = params["rating2"].to_i
		b.rating3 = params["rating3"].to_i
		b.rating4 = params["rating4"].to_i
		b.rating5 = params["rating5"].to_i
		b.save
	redirect "/thanks"
end

# Thanks user for submitting survey feedback
get "/thanks" do
	erb :thanks
end

get "/survey_completed" do
	@m = PatientInfo.all()
	erb :survey_completed
end

# About Page
get "/about" do
	erb :about
end