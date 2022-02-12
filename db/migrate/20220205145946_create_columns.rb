class CreateColumns < ActiveRecord::Migration[7.0]
  def change
    create_table :columns do |t|
      t.string :name
      t.text :description

      t.references :board
      t.timestamps
    end
  end
end
