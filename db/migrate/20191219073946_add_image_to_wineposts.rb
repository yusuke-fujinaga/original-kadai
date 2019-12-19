class AddImageToWineposts < ActiveRecord::Migration[5.2]
  def change
    add_column :wineposts, :image, :string
  end
end
