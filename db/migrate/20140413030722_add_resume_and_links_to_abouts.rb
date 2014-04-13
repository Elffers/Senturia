class AddResumeAndLinksToAbouts < ActiveRecord::Migration
  def change
    add_column :abouts, :resume, :string
  end
end
