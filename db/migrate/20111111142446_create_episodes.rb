class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.references :show
      t.integer :number, :null => false
      t.integer :season, :null => false

      t.timestamps
    end
    add_index :episodes, :show_id
  end
end
