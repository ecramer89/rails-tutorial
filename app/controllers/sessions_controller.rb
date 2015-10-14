class SessionsController < ApplicationController
  #Sessions are resources but we are not storing them in the database so they are not "models"
  
  #get the log in page
  def new
  end
  
  #post log in credentials; save in temporary session
  #form for will place in params a hash of values associated withn key named :session
  def create
    #check if there is a user with the given email
    #and authenticate (using the authenticate method with the secure hashed password) the user
    @user=User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user #save the user's credentials in the (rails) session object
      redirect_to user_url(session[:user_id]) #now that we've saved the user's log in credentials, we can access them from anywhere in the code from the global sessions object
    else 
      flash[:danger] = "Incorrect log in"
      redirect_to login_url
    end
  
  end

  #log out; destroy the session
  def destroy
  end
end
