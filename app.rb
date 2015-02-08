require("bundler/setup")
Bundler.require(:default)

Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }


get("/") do
  erb(:index)
end

get("/categories") do
  @categories = Category.all()
  erb(:categories)
end

post("/categories") do
  category = Category.create({ :type_of => params["category_type"] })
  @categories = Category.all()
  redirect("categories")
end

get("/categories/:id") do
  @category = Category.find(params["id"])
  erb(:recipe_list)
end

get("/create_recipe") do
  @recipes = Recipe.all()
  erb(:create_recipe)
end

get("/add_ingredients/recipe/:id") do
  @recipe = Recipe.find(params["id"])
  erb(:add_ingredients)
end

post("/add_ingredients/recipe/:id") do
  recipe = Recipe.create({ :name => params["name"], :oven_temp => params["oven_temp"], :prep => params["prep"], :steps => params["steps"], :pairing => params["pairing"] })
  ingredients = Ingredient.create({ :name => params["name"], :quantity => params["quantity"] })
  @ingredients = Ingredient.all()
  @recipes = Recipe.all()
  redirect("add_ingredients")
end
