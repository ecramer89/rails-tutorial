module SessionsHelper
    #@current_user-- we need the @ symbol always because that is what makes it a "class variable" that is accessible outside of the method body
    
    #store the user information in a rails session resource
    def log_in user
        session[:user_id]=user.id
    end
    
    
    #log out the current user.
    #delete the user's id from the user_id key of the sessions hash
    #set @current_user to nil
    def log_out
        session.delete :user_id
        @current_user=nil 
    end
    
    
    
    #retrieve the user that is currently logged in
    def current_user
        #caches the logged in user in a member variable (persists outside of the method) @current_user
        #if we have already cached current_user, just return it
        #note: use the find_by instead of the find method (even though the default search key for find is id) because find will fail if
        #the session does not contain a valid id.
       @current_user ||= User.find_by(id: session[:user_id])
    end
    
    
    def logged_in? 
       current_user!=nil 
    end
    
    
end
