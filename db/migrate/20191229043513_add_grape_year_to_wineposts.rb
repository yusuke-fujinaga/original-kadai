class AddGrapeYearToWineposts < ActiveRecord::Migration[5.2]
  def change
    add_column :wineposts, :grape_year, :string
  end
end
