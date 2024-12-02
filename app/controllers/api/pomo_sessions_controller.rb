class Api::PomoSessionsController < ApplicationController
  # GET /pomo_sessions
  def index
    time_range = params[:time_range] # "this_week"
    raw_date = params[:date] # "2024-02-22T18:46:10.806Z"
    current_date = DateTime.parse(params["date"]) # Thu, 22 Feb 2024 18:38:59 +0000

    @pomo_sessions = @current_user.pomo_sessions_for_the_week(time_range, current_date)

    # @pomo_sessions = @current_user.pomo_sessions.where() # filter the array to include sessions only for this week using the current_date or raw_date variable

    # binding.break
    # # instance example
    # # {
    # # "id": 1,
    # # "session_type": "Study",
    # # "total_time": 1500,
    # # "date": "2/22/2024, 12:06:22 PM",
    # # "user_id": 1,
    # # "created_at": "2024-02-22T17:06:22.862Z",
    # # "updated_at": "2024-02-22T17:06:22.862Z"
    # # }

    # case time_range
    # when 'today'
    #   @pomo_sessions = @pomo_sessions.where("date >= ? AND date < ?", current_date.beginning_of_day, current_date.end_of_day)
    # when 'this_week'
    #   binding.break
    #   @pomo_sessions = @pomo_sessions.where("date >= ? AND date <= ?", current_date.beginning_of_week, current_date.end_of_week)
    # when 'this_month'
    #   @pomo_sessions = @pomo_sessions.where("date >= ? AND date <= ?", current_date.beginning_of_month, current_date.end_of_month)
    # when 'this_year'
    #   @pomo_sessions = @pomo_sessions.where("date >= ? AND date <= ?", current_date.beginning_of_year, current_date.end_of_year)
    # end

    # # binding.break
    render json: @pomo_sessions
  end

  # GET /pomo_sessions/:id
  def show
    @pomo_session = PomoSession.find(params[:id])
    render json: @pomo_session
  end

  # POST /pomo_sessions
  def create
    @pomo_session = @current_user.pomo_sessions.create!(pomo_session_params)
    render json: @pomo_session, status: :created
  end

  private

  # Only allow a list of trusted parameters through.
  def pomo_session_params
    params.permit( :session_type, :total_secs, :session_date)
  end
end
