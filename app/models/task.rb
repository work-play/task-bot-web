class Task < ApplicationRecord
  belongs_to :user
  has_many :goal_dates, dependent: :destroy
end
