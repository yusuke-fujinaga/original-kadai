class CreateWineposts < ActiveRecord::Migration[5.2]
  def change
    create_table :wineposts do |t|
      t.string :wine_type
      t.string :grape_varieties
      t.string :country
      t.string :review
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
