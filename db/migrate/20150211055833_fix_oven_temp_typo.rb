class FixOvenTempTypo < ActiveRecord::Migration
  def change
    remove_column(:recipes, :ovem_temp, :integer)
    add_column(:recipes, :oven_temp, :integer)
  end
end
