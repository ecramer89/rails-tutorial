require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  #setup method run before any tests
  def setup 
    @user=User.new(name: "Emily Cramer", email: "emily@emily.com", password: "puppy", password_confirmation: "puppy")
  end 

  test "should_be_valid" do
    assert @user.valid?
  end
  
  test "should_be_invalid_blank_name" do
    @user.name=" "
    assert_not @user.valid?
  end
  
  test "should_be_invalid_blank_email" do
    @user.email=" "
    assert_not @user.valid?
  end
  
  
  test "invalid_too_long_name" do
    @user.name="e"*51 #string multiplication!
    assert_not @user.valid?
  end
  
  
  test "invalid_too_long_email" do
    @user.email="t"*51
    assert_not @user.valid?
  end
  
  
  test "valid_email_addresses" do
    valid_addresses=%w[puppy@dot.com 4545gg@d.ca 65_g_33@sfu.uk]
    for valid_address in valid_addresses do
      @user.email=valid_address
      assert @user.valid?, "#{valid_address.inspect}: should be valid"
    end
  end
  
  
  test "invalid_email_address" do
    invalid_email_addresses=%w[gergmail.com wgec@ ghf@der,com ewwer@.com]
  for invalid_address in invalid_email_addresses do
    @user.email=invalid_address 
    assert_not @user.valid?, "#{invalid_address.inspect}: should be invalid"
  end
  end
  
  
  
  test "invalid_need_unique_email_case_insensitive" do
    dup_user=@user.dup
    #dup_user.email=@user.email
    dup_user.email.upcase! #I think that the ! converts the method into a field mutator. otherwise it would just return a copy of the string in upper case
    @user.save #save the user to the database. The uniqueness validation checks if an activeRecord with the attribute exists in the DATABASE
    assert_not dup_user.valid?
  end
  
  
  
  
  
  
  
end
