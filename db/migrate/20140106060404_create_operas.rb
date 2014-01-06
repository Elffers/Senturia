class CreateOperas < ActiveRecord::Migration
  def change
    create_table :operas do |t|
      t.string :name

      t.timestamps
    end
  end
end
