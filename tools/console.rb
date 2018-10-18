require_relative '../config/environment.rb'

# USERS #
steven = User.new("Steven")
natasha = User.new("Natasha")
# INGREDIENTS #
pasta = Ingredient.new("pasta")
basil = Ingredient.new("basil")
peppers = Ingredient.new("peppers")
pine_nuts = Ingredient.new("pine_nuts")
tomato = Ingredient.new("tomato")
mozzarella = Ingredient.new("mozzarella")
# RECIPES #
pesto_pasta = steven.create_a_recipe("Pesto Pasta")
pepper_pine = natasha.create_a_recipe("Pepper Pine")
caprese = natasha.create_a_recipe("Caprese")
# RECIPE_INGREDIENTS #
pesto_pasta.add_ingredients([pasta, basil, pine_nuts])
pepper_pine.add_ingredients([peppers, pine_nuts])
caprese.add_ingredients([mozzarella, basil, tomato])
# RECIPE_CARDS #
s_pesto_pasta_recipe_card = steven.add_recipe_card(pesto_pasta, "10/10/18", 4)
n_pepper_pine_recipe_card = natasha.add_recipe_card(pepper_pine, "09/10/18", 2)
s_pepper_pine_recipe_card = steven.add_recipe_card(pepper_pine, "11/10/18", 3)
s_caprese_recipe_card = steven.add_recipe_card(caprese, "15/10/18", 4)
# ALLERGENS #
natasha.declare_allergen(pine_nuts)
steven.declare_allergen(pine_nuts)
steven.declare_allergen(peppers)









binding.pry
