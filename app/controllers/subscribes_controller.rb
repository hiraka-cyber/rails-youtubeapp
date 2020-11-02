class SubscribesController < ApplicationController
  def create
      @user = User.find(params[:subscribes][:subscribe_id])
      current_user.subscribe!(@user)
      redirect_to @user
  end

  def destroy
      @user = Subscribe.find(params[:id]).subscribe
      current_user.unsubscribe!(@user)
      redirect_to
end
