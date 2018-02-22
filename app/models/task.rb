class Task < ApplicationRecord
  belongs_to :user
  has_many :goal_tasks, dependent: :destroy
end
