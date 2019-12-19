class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :winepost, foreign_key: true

      t.timestamps
      t.index [:user_id, :winepost_id], unique: true
    end
  end
end
