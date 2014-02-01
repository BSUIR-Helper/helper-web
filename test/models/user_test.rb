require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user is not admin by default" do
    user = User.new
    assert user.admin? == false, 'is admin'
  end
end
