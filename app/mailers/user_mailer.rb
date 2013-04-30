class UserMailer < ActionMailer::Base
  default from: "haug.lianne@gmail.com"

  def reply_message(message, email)
  	@message = message
  
  	mail(:to => email, :subject => 'Re: from KnowYourFood');
  end


end
