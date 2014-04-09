class StaticPagesController < ApplicationController


	def home
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
  
	  @shown_month = Date.civil(@year, @month)
    @event_strips = Event.event_strips_for_month(@shown_month)
 
	@events = Event.all
	@user = User.all
	@users = User.paginate(:page=> params[:page])

	end

  def help
  end

  def user
  end

  def projects
  end
end
