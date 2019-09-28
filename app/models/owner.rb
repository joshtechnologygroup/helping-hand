class Owner < ApplicationRecord
  has_many :task_owners
  has_many :tasks, through: :tasks
  belongs_to :user
end
