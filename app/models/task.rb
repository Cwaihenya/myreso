class Task < ApplicationRecord
belongs_to :resolution
validates :task_name, presence: true
validates :task_details, presence: true
end
