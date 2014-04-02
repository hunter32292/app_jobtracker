class UsersController < ApplicationController

	def show
		@user = User.find(params[:id])
	end

	
	def new
		@user = User.new
	end

	def edit 
		@user = User.find(params[:id])
		@schdules = @user.schdule(params[:id])
	end 

	def destroy 
		User.find(params[:id]).destroy
		User.schdule.find(params[:id])
		flash[:succes] = "User destroyed"
		redirect_to @user 
	end

	def update
		if	@user = User.find(params[:user])
			flash[:succes] = "User Updated"
		else
		render 'edit'
		end
	end

	private
		
		def admin_user
			redirect_to(root_url) unless current_user.admin?
		end
		
		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_url) unless current_user?(@user)
		end


end
