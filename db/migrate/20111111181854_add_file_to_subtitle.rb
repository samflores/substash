class AddFileToSubtitle < ActiveRecord::Migration
  def change
    add_column :subtitles, :file, :string
  end
end
