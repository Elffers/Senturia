class ChangeVisitorsColumns < ActiveRecord::Migration
  def change
    rename_column :visitors, :page_visits, :pageview_visits
    add_column :visitors, :visit_count, :integer, default: 0
  end
end
