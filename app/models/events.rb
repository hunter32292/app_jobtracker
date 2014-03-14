class Events < ActiveRecord::Base
# Table name: events
#
#  id           :integer(11)     not null, primary key
#  title        :string(255)
#  date         :datetime
#  end_date     :datetime
#  summary      :text
#  content      :text
#  created_at   :datetime
#  updated_at   :datetime
  attr_accessible :content, :created_at, :date, :end_date, :summary, :title, :updated_at

	belongs_to :schedule

	#Converting the events records to Ical records (.ics)
	def to_ics
		event = Icalendar::Event.new
		event.start = self.date.strftime("%Y%m%dT%H%M%S")#times use the Y/M/D
		event.end = self.end_date.strftime("%Y%m%dT%H%M%S")# and T H/M/S format
		event.summary = self.title
		event.description = self summary
		event.location = 'Here !'
		event.klass = "PUBLIC"
		event.created = self.created_at
	  event.last_modified = self.updated_at
		event.uid.event.url="#{PUBLIC_URL}events/#{self.id}"
		event.add_comment("AF83 -Shake your digital, we do WowWare")
		event
	end

	validates :title, :presence => true
	validates :date, :presence => true



end



