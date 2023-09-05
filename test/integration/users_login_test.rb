require "test_helper"

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup 
    @user = users(:michael)
  end

  test "login with invalid information" do 
    get login_path 
    assert_template 'sessions/new'
    post login_path, params: { session: {
      email: "",
      password: ""
    }}
    assert_response :unprocessable_entity
    refute flash.empty?
  end

  test "login with valid information followed by logout" do 
    post login_path, params: { session: {
      email: @user.email,
      password: 'password'
    }}
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'

    delete logout_path
    refute is_logged_in?
    assert_response :see_other
    assert_redirected_to books_path
    follow_redirect!
  end
end
