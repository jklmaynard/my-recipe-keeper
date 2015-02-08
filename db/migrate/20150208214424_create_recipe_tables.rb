class CreateRecipeTables < ActiveRecord::Migration
  def change
    create_table(:categories) do |t|
      t.column(:type_of, :string)
    end
    
    create_table(:ingredients) do |t|
      t.column(:name, :string)
      t.column(:quantity, :string)
      t.column(:created_at, :datetime)
      t.column(:updated_at, :datetime)
    end
    
    create_table(:ingredients_recipes) do |t|
      t.column(:ingredient_id, :integer)
      t.column(:recipe_id, :integer)
    end
    
    create_table(:recipes) do |t|
      t.column(:name , :string)
      t.column(:created_at , :datetime)
      t.column(:updated_at , :datetime)
      t.column(:category_id , :integer)
      t.column(:ovem_temp , :integer)
      t.column(:prep , :string)
      t.column(:steps , :string)
      t.column(:pairing , :string)
    end
    
  end
end
