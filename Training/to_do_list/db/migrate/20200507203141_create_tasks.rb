class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :priority_rank, default: 0

      t.timestamps
    end
  end
end
