class PomoSession < ApplicationRecord
  belongs_to :user

  validates :session_type, presence: true
  validates :total_time, presence: true
end
