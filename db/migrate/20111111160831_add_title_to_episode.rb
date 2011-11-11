class AddTitleToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :title, :string
  end
end
