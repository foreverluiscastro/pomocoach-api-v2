class Api::OpenaiController < ApplicationController
  def index
    time_range = params[:time_range] # "this_week"
    raw_date = params[:date] # "2024-02-22T18:46:10.806Z"
    current_date = DateTime.parse(params['date']) # Thu, 22 Feb 2024 18:38:59 +0000

    # debugger
    prompt = <<~PROMPT
      **Subject:** Analysis of Study Times to Enhance Efficiency

      **Objective:** Provide targeted recommendations to improve user's study routines.

      **User Profile:**
      - Current Date: #{current_date}
      - Study Goal: #{@current_user.study_goal}
      - Daily Study Goal: #{@current_user.daily_goal} minutes
      - Additional Details: #{@current_user.details}

      **Weekly Study Sessions Summary:**
      #{@current_user.pomo_sessions_for_the_week(time_range, current_date)}


      **Deliverables:**
      - Offer actionable strategies to optimize study habits.
      - Ensure the response is concise and limited to 400 characters.
      - Focus solely on personalized advice without suggesting other applications.

    PROMPT

    @response = OpenaiService.new(prompt).call

    @response = @response.split('.')

    render json: { data: @response }
  end
end
