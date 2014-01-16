class CreateBrowsers < ActiveRecord::Migration
  def change
    create_table :browsers do |t|
      t.integer :chrome
      t.integer :firefox
      t.integer :safari
      t.integer :ie
      t.integer :opera
      t.integer :other      

      t.timestamps
    end
  end
end
