class SessionsController < ApplicationController
  def new
  end

  def create
    puts 'laaaaaaa'
    puts params[:email]
    puts params[:password]
  user = User.authenticate(params[:user][:email], params[:user][:password])
  puts user
  puts 'laaaaaaaa'
  if user
    session[:user] = user
    redirect_to root_url, :notice => "Logged in!"
  else
    @error = "Invalid email or password"
    render "new"
  end
end

def delete
  session[:user] = nil
  redirect_to root_url, :notice => "Logged out!"
end
end
