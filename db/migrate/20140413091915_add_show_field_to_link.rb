class AddShowFieldToLink < ActiveRecord::Migration
  def change
    add_column :links, :show, :boolean
  end
end
