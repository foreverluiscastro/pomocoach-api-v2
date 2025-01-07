class Api::SessionsController < ApplicationController
  skip_before_action :authorize, only: :create
  # POST /login
  def create
    @user = User.find_by(username: params[:username])
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      render json: user_with_picture(@user)
    else
      render json: { errors: ['Invalid username or password'] }, status: :unauthorized
    end
  end

  # DELETE /logout
  def destroy
    session.delete :user_id
    head :no_content
  end

  # Method to include the user's profile picture in the response
  def user_with_picture(user)
    user.as_json.merge(
      profile_picture_url: user.profile_picture.attached? ? user.profile_picture.url : nil
    )
  end
end
