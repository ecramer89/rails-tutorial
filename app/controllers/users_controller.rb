class UsersController < ApplicationController
  
  def new
    #create a new user to be initialized by form_for helper
    flash[:notice] = "Oh boy it is time to sign up"
    @user=User.new
  end
  
  #action that handles URLs that do not specify the id of a particular user (only supports get request)
  def index
    @all_users=User.all
  end
  
  #action that handles POST requests to the /users url (forms for new Users will route here; forms for old Users route to edit)
  def create
    @user=User.new(user_params)
    if @user.save 
      flash[:notice] = "You did it!"
      log_in @user
      redirect_to user_path(@user)
    else 
      flash[:error] = "You did not do it"
    render 'new'
  end #if/then blocks also require an "end"
  end
  
  #implicit return a filtered params hash containing the name, email, password and password_confirmation fields of the user that were passed in through the form in the raw
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  #action that handles URLs that specify the id of a particular user (i.e., get, edit, delete, users/2, users/7, etc)
  def show
    @the_user=User.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:notice] = "No user with that id!"
    redirect_to cats_url #the benefit of naming a route is that it is easy to re_direct to it. pass the named url that is given to you when you define a named route (as in the examples in the routes file)
  end
  
  
end
