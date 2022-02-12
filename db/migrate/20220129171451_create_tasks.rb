class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description

      t.references :column
      t.timestamps
    end
  end
end
