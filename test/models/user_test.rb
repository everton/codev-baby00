require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'validation of blank name' do
    invalid_user = User.new name: '     '

    refute invalid_user.valid?, 'User with blank name should be invalid'

    assert_includes invalid_user.errors[:name], 'can\'t be blank'
  end

  test 'validation of blank email' do
    invalid_user = User.new email: '     '

    refute invalid_user.valid?, 'User with blank email should be invalid'

    assert_includes invalid_user.errors[:email], 'can\'t be blank'
  end
end
