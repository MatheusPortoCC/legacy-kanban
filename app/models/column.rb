class Column < ApplicationRecord
  belongs_to :board

  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: :all_blank

  validates :name, presence: true
end
