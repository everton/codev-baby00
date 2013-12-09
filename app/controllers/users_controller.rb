# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    respond_to do |format|
      format.html do
        if @user.save
          redirect_to @user, notice: 'Seu chá de bebê foi cadastrado.'
        else
          render action: 'new'
        end
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
