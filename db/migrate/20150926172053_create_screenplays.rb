class CreateScreenplays < ActiveRecord::Migration
  def change
    create_table :screenplays do |t|
      t.text :fountain
      t.string :secure_id
      t.string :title
      t.string :author_name
      t.string :password

      t.timestamps null: false
    end
  end
end
