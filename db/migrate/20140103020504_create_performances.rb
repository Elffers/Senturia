class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.string :date
      t.string :venue
      t.text :program

      t.timestamps
    end
  end
end
