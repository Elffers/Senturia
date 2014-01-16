class ChangeColumnsForBrowsers < ActiveRecord::Migration
  def change
    remove_column :browsers, :chrome
    remove_column :browsers, :firefox
    remove_column :browsers, :safari
    remove_column :browsers, :ie
    remove_column :browsers, :opera
    remove_column :browsers, :other
    add_column :browsers, :name, :string
  end
end
