class Task < ApplicationRecord
  has_many :owners
  has_many :task_owners, through: :owners
  has_many :task_keyword_collections
  has_many :keyword_collections, through: :task_keyword_collections

  validates :title, presence: true
end
