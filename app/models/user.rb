class User < ApplicationRecord
  has_many :pomo_sessions

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :daily_goal, presence: true

  def pomo_sessions_for_the_week(time_range, date)
    # time_range = params[:time_range] # "this_week"
    # raw_date = params[:date] # "2024-02-22T18:46:10.806Z"
    # current_date = DateTime.parse(params["date"]) # Thu, 22 Feb 2024 18:38:59 +0000

    start_of_week = date.beginning_of_week
    end_of_week = date.end_of_week

    self.pomo_sessions.where(date: start_of_week..end_of_week)
  end
end
