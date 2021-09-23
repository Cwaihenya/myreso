class Task < ApplicationRecord
belongs_to :resolution
validates :task_title, presence: true
validates :task_details, presence: true
end
