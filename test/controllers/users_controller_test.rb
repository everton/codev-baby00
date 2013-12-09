# -*- coding: utf-8 -*-

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

  test 'routes for creation of usuarios' do
    assert_routing({ method: :post, path: '/users'    },
                   { controller: 'users', action: 'create' })
  end

  test 'show action' do
    get :show, id: users(:antonio).id

    assert_response :success

    assert_select 'h1', 'Chá de bebê de Antonio e Marina'
  end

  test 'new action with form for creation of user' do
    get :new

    assert_response :success

    assert_select 'h1', 'Cadastre seu chá de bebê'

    assert_select 'form[method=?][action=?]', 'post', users_path do
      assert_select 'input[type=?][name=?]', 'text',  'user[name]'
      assert_select 'input[type=?][name=?]', 'email', 'user[email]'
    end
  end

  test 'creation of user when posting correct data' do
    assert_difference 'User.count' do
      post :create, user: {
        name: 'Joaozinho', email: 'john@example.com'
      }
    end

    assert_redirected_to user_path(assigns(:user))

    assert_equal 'Seu chá de bebê foi cadastrado.', flash[:notice]
  end
end
