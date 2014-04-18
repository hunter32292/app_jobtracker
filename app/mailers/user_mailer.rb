class UserMailer < ActionMailer::Base
  default from: "John@ILikeTurtles.com"


	def index
		@user = 'johnstupka'
		url = 'http://example.com/login'
		mail(:to=> @user.email, :subject=> 'welcome to my awesome app!'
	end 


end
