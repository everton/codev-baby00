class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def create
  end

  def new
  end
end
