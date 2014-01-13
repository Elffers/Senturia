class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :ip_address
      t.boolean :mobile
      t.string :browser
      t.integer :page_visits
      t.time :start_time
      t.time :end_time
      t.string :language

      t.timestamps
    end
  end
end
