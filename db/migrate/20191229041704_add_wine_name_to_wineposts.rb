class AddWineNameToWineposts < ActiveRecord::Migration[5.2]
  def change
    add_column :wineposts, :wine_name, :string
  end
end
