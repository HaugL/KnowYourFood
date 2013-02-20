class SessionsController < ApplicationController
  def new
  end

  def create
  user = User.authenticate(params[:user][:email], params[:user][:password])

  if user
    #If user is an admin set the session as an admin
    if user.admin
      session[:admin] = user
    else
      session[:user] = user
    end

    redirect_to root_url, :notice => "Logged in!"
  else
    @error = "Invalid email or password"
    render "new"
  end
end

  def delete
    reset_session
    puts 'Admin:'
    puts session[:admin]
    puts 'User'
    puts session[:user]
    redirect_to root_url, :notice => "Logged out!"
  end

end
