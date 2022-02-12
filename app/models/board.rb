class Board < ApplicationRecord
  belongs_to :user

  has_many :columns, dependent: :destroy
  accepts_nested_attributes_for :columns

  validates :name, presence: true
end
