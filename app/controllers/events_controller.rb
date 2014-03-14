class EventsController < ApplicationController



	# this is the Ical to create it's initial blank cal
	# http://dev.af83.com/2008/03/04/publishing-icalendar-events-with-ruby-on-rails.html
	# to see process go to the above link
	def show
		@event = Event.find(params[:id])
	
		respond_to do |wants|
			wants.html
			wants.ics do 
				calendar = Icalendar::Calendar.new
				calendar.add_event(@event.to_ics)
				calendar.publish
				render :text => calendar.to_ical
			end
		end
	end

	def edit
	end
	
	#This is going to send e-mail to specfic users, allowing them to see a event
	def notification
		def meeting_request
			mail(:to=> @user.find(params[:email]), :subject => "icalendar", 
						:from => "icalendar@uwec.edu") do |format| #This will need to be the calendar e-mail
				format.ics{
				ical = Icalendar::Calendar.new
				e = Icalendar::Event.new
				e.start = DateTime.now.utc
				e.start.icalendar_tzid = "UTC"				
				e.end = (DateTime.now + 1.day).utc 
				e.end.icalendar_tzid = "UTC"
				e.organizer "icalendar@uwec.edu"
				e.uid "meeting request"
				e.summary "scrum meeting"
				e.description <<-EOF
						Venue: office
						Date: 21 March 2014
						Time: 2 PM
				EOF
				ical.add_event(e)
				ical.publish
				ical.to_ical
				render :text => ical.to_ical
		end
	end 			

end
