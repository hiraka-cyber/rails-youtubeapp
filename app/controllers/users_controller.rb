class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def subscribe
    @user  = User.find(params[:id])
    @users = @user.subscribes
    render 'show_follow'
  end

  def subscribers
    @user  = User.find(params[:id])
    @users = @user.subscribers
    render 'show_follower'
  end
end
