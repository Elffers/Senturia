class AddComposerId < ActiveRecord::Migration
  def change
    add_column :operas, :composer_id, :integer
  end
end
