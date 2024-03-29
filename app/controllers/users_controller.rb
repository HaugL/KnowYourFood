class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
	  @user = User.new
	  @user.email = params[:user][:email]
	  @user.name = params[:user][:name]
	  @user.password = params[:user][:password]
	  @user.password_confirmation = params[:user][:password_confirmation]
	  if @user.save
	  	session[:user] = @user.id
	    redirect_to root_url, :notice => "Signed up!"
	  else
	    render "new"
	  end
	end

end
