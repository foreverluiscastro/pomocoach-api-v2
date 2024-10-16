class PomoSession < ApplicationRecord
  belongs_to :user

  validates :session_type, presence: true
  validates :total_secs, presence: true
end
