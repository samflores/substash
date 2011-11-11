class CreateSubtitles < ActiveRecord::Migration
  def change
    create_table :subtitles do |t|
      t.references :episode
      t.integer :downloads

      t.timestamps
    end
    add_index :subtitles, :episode_id
  end
end
