class AddCookieId < ActiveRecord::Migration
  def change
    add_column :visitors, :cookie_id, :string
  end
end
