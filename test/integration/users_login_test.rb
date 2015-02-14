require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
	  
	test "login with invalid info"
	  get login_path
	  assert_template 'sessions/new'
	  post login_path session: {room_code: ""}
	  assert_template 'sessions/new'
	  assert_not flash.empty?
	  get root_path
	  assert flash.empty?
	end

end
