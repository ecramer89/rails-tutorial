require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Welcome To The Page For | HOME"
  end

  test "should get help" do
    get :help
    assert_response :success
   assert_select "title", "Welcome To The Page For | HELP"
  end
  
  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "Welcome To The Page For | ABOUT"
  
  end

end
