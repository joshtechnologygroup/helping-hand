class KeywordCollection < ApplicationRecord
  has_many :task_keyword_collections
  has_many :tasks, through: :task_keyword_collections
end
