class SessionsController < ApplicationController
  def new
    @return_to = params[:return_to]
  end

  def create
    user = User.authenticate(params[:user][:email], params[:user][:password])

    if user
      #If user is an admin set the session as an admin
      if user.admin
        session[:admin] = user.id
      else
        session[:user] = user.id
      end

      redirect_to params[:user][:return_to]
    else
      @error = "Invalid email or password"
      @return_to = params[:user][:return_to]
      render "new"
    end
  end

  def destroy
    reset_session
    puts 'Admin:'
    puts session[:admin]
    puts 'User'
    puts session[:user]
    redirect_to root_url, :notice => "Logged out!"
  end

end
