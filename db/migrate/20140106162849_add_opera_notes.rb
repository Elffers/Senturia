class AddOperaNotes < ActiveRecord::Migration
  def change
    add_column :operas, :notes, :string
  end
end
