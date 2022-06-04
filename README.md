# DHRsurvey
POC Patient Survey Web Portal

Web Engineer Survey Assignment - The Following project is a poc site which allows dhr patients to provide feedback on their recent hospital stay.

##### The following are the asked requirements of survey site:
<requirements>> 1.  The web application will consist of 2 pages and should be mobile friendly:
> 
>     A.  Page 1 - Survey Form for Patients that visited hospital
>     
>     B.  Page 2 - A thank you form
> 2.  Survey Form Page Should request for user input on the following
> 
>      A.  Satisfaction Assessment for each category (Response options should be: Unhappy, Neutral, Happy)
>      - Courtesy of staff who admitted you
>      - Room cleanliness
>      - Noise level in and around your room
>      - Quality of food
>      - Friendliness/courtesy of nurses
>      
>      B.  Patient Details
>      - First Name
>      - Last Name
>      - Phone Number (area code and full number)
>        
> 3.  Thank You Page
> 
>      A.  Display “Thank you for providing your feedback”
>      
>      B.  Back button on browser should not allow user to go back to previous survey response
> 4.  Survey Entries
> 
>      A.  User entries should be stored to a database of your choice
>      
>      B.  Data should be stored to a database table, with appropriate storage types
>      - Entry Time (date and time survey was submitted) - datetime
>      - First Name
>      - Last Name
>      - Phone Number
>      - Q1-Q5 Responses
>
> Your web application will be assessed based on overall design, functionality and coding standards. Only allow entries if the survey form is filled out accurately. DHR Health Color is a Plus*: https://www.pantone.com/color-finder/3272-C. Key elements that will be reviewed:
> 
>1. User Interface Design
>2. User Experience
>3. Mobile friendly layout
>4. Survey Entry Storage
>5. Client Side Coding
>6. Server Side Coding
</requirements>

#### Survey site built using the Following:
- Front End - HTML, CSS, Javascript
- Backend - Ruby on Sinatra, Datamapper(SQLite)

#### Quirks:
- User is able to go back after submitting survey data: Possible simple fix using js/jquery to detect back button press and redirect.
- Radio buttons unable to clear after incorrect form submission: current workaround is to always have them selected, a possible fix is to clear entire form but seems a bit excessive (still looking).

#### Future:
- Transition from Ruby and SQLite over to c# and MS SQL

#### How To Run
Program built with Ruby Sinatra, need working environment to run.
- [Gettng started with Sinatra](https://www.digitalocean.com/community/tutorials/how-to-install-and-get-started-with-sinatra-on-your-system-or-vps).
- clone repo and cd into working directory.
- Install required gems: bundle install
- Run server: bundle exec ruby app.rb
- In browser (preferably chrome) go to localhost:4567 to load site.
