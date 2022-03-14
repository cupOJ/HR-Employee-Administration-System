require "test_helper"

class UserTest < ActiveSupport::TestCase
  it 'can save a user' do
    user = User.new(name: "test")
    assert user.save
  end
end
