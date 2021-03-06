class Resolution < ApplicationRecord
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true
has_many :blogs
belongs_to :user
validates :title, presence: true

validates :details, presence: true
validates :end_date, presence: true
end
