class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper #need to explicitly include your own helpers and modules, even those automatically generated
  
  def hello
    render text: "Hello!"
  end
end
