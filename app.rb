require("bundler/setup")
Bundler.require(:default)

configure :development do 
  set :bind, '0.0.0.0'
  set :port, 3000
end
  
Dir[File.dirname(__FILE__) + "/lib/*.rb"].each { |file| require file }

get("/") do
  @recipes = Recipe.all()
  erb(:index)
end

get("/recipe/:id") do
  @recipe = Recipe.find(params["id"])
  erb(:recipe)
end

get("/create_recipe") do
  @recipes = Recipe.all()
  erb(:create_recipe)
end

post("/add_recipe") do
  recipe = Recipe.create({ :name => params["name"], :oven_temp => params["oven_temp"], :prep => params["prep"], :steps => params["steps"], :pairing => params["pairing"] })
  @recipes = Recipe.all()
  erb(:submissions)
end
