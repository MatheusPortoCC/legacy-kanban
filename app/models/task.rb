class Task < ApplicationRecord
  belongs_to :column
  
  validates :name, presence: true
end
