class Task < ApplicationRecord
  belongs_to :column
  
  validates :name, presence: true
  
  after_update :update_task_frame
  after_create :create_task_frame

  def board
    column.board
  end

  def update_task_frame
    broadcast_remove_to board, target: "task_#{id}"
    broadcast_prepend_to board, target: "column_#{column_id}"
  end

  def create_task_frame
    broadcast_prepend_to board, target: "column_#{column_id}"
  end
end