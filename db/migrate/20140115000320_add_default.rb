class AddDefault < ActiveRecord::Migration
  def change
    change_column :visitors, :pageview_visits, :integer, default: 0
  end
end
