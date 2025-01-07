class Api::UsersController < ApplicationController
  skip_before_action :authorize, only: :create

  # POST /signup
  def create
    @user = User.create!(user_params)
    @user.profile_picture.attach(params[:profile_picture]) if params[:profile_picture].present?
    session[:user_id] = @user.id
    render json: user_with_picture(@user), status: :created
  end

  # GET /me
  def show
    render json: user_with_picture(@current_user)
  end

  # PATCH /me
  def update
    @current_user.update!(user_params)
    render json: user_with_picture(@current_user)
  end

  # DELETE /delete_account
  def destroy
    @current_user.destroy
    render json: { message: "Account Deleted Successfully" }
  end

  private

  # Method to include the user's profile picture in the response
  def user_with_picture(user)
    user.as_json.merge(
      profile_picture_url: user.profile_picture.attached? ? user.profile_picture.url : nil
    )
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.permit(:username, :password, :password_confirmation, :daily_goal, :study_goal, :details)
  end
end
