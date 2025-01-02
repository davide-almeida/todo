class Task < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  scope :completed, -> { where(completed: true) }
  scope :uncompleted, -> { where(completed: false) }
end
