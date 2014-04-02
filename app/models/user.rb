# == Schema Information
#
# Table name: users
#
# id :integer not null, primary key
# name :string(255)
# email :string(255)
# department :string(255)
# created_at :datetime not null
# updated_at :datetime not null
# username: string(255)

class User < ActiveRecord::Base
  attr_accessible :username, :department, :email, :name

	belongs_to :department
	has_many :events

		
#	validates :name, :presence=> true
#	validates :department, :presence=> true
	
	private


end
