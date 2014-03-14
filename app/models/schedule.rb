class Schedule < ActiveRecord::Base

# == Schema Information
#
# Table name: users
#
# id :integer not null, primary key
# day :string(255)
# start :datetime
#	end  :datetime 
#	userid :integer
#
	attr_accessible :day, :end, :start, :userid
	has_many :events

	


	validates :userid, :presence => true	



end
