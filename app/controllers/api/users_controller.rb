class Api::UsersController < ApplicationController
  skip_before_action :authorize, only: :create
  # POST /signup
  def create
    @user = User.create!(user_params)
    session[:user_id] = @user.id
    render json: @user, status: :created
  end

  # GET /me
  def show
    render json: @current_user
  end

  # PATCH /me
  def update
    @current_user.daily_goal = params[:daily_goal]
    @current_user.save
    render json: @current_user
  end

  # DELETE /delete_account
  def destroy
    @current_user.destroy
    render json: { message: "Account Deleted Successfully"}
  end

  private

  # Only allow a list of trusted parameters through.
  def user_params
    params.permit( :username, :password, :password_confirmation, :daily_goal, :study_goal, :details )
  end
end
