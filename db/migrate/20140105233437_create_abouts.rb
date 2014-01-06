class CreateAbouts < ActiveRecord::Migration
  def change
    create_table :abouts do |t|
      t.text :bio

      t.timestamps
    end
  end
end
