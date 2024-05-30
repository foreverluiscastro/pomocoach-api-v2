class Api::OpenaiController < ApplicationController
  def index
    time_range = params[:time_range] # "this_week"
    raw_date = params[:date] # "2024-02-22T18:46:10.806Z"
    current_date = DateTime.parse(params['date']) # Thu, 22 Feb 2024 18:38:59 +0000

    # debugger
    prompt = <<~PROMPT
      Analyze this user's study habits and provide advice for maximizing efficiency.

      User Details:
      - Current Date: #{current_date}
      - Study Goal: #{@current_user.study_goal}
      - Daily Study Goal: #{@current_user.daily_goal} minutes
      - Additional Details: #{@current_user.details}

      Weekly Study Sessions:
      #{@current_user.pomo_sessions_for_the_week(time_range, current_date)}

      Keep in mind total_time is represented in seconds

      Please provide actionable advice in under 400 characters.

      Please do not recommend other apps.
    PROMPT

    @response = OpenaiService.new(prompt).call

    @response = @response.split('.')

    render json: { data: @response }
  end
end
