class CreateScreenplays < ActiveRecord::Migration
  def change
    create_table :screenplays do |t|
      t.text :fountain
      t.string :title

      t.timestamps null: false
    end
  end
end
