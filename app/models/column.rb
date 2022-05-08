class Column < ApplicationRecord
  belongs_to :board

  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, reject_if: :all_blank

  validates :name, presence: true
  after_create :create_column_frame
  
  def create_column_frame
    broadcast_remove_to board, target: "new_column"
    broadcast_append_to board, target: "board_#{board.id}"

    board.broadcast_append_to board, target: "board_#{board.id}", partial: "columns/form", locals: { column: Column.new, board: board }
  end
end
