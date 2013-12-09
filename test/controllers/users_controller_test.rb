require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test 'routes for show at baby shower path' do
    assert_routing({ method: :get, path: '/cha/XXX' },
                   { controller: 'users', action: 'show',
                     id: 'XXX' })
  end

  test 'routes for new at home (root) path' do
    assert_routing({ method: :get, path: '/'    },
                   { controller: 'users', action: 'new' })
  end

  test "should get show" do
    get :show, id: 'XXX'
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end
end
