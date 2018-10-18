class User
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def create_a_recipe(name)
        Recipe.new(name)
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(recipe, self, date, rating)
    end

    def recipes
        RecipeCard.all.select { |rc| rc.user == self }
    end

    def declare_allergen(ingredient)
        Allergen.new(self, ingredient)
    end

    def allergens
        Allergen.all.select { |a| a.user == self }
    end

    def top_three_recipes
        recipes.max_by(2) { |rc| rc.rating }
    end

    def most_recent_recipe
        # return most recent added recipe
        recipes[-1]
    end

    def allergen_ingredients
        allergens.map{ |allergen| allergen.ingredient} #array
    end

    def unsafe_recipes
        #reurns an array of recipes that the user is not allergic to
        RecipeIngredient.all.each { |recipe|
            allergen_ingredients.map { |ing|
                if recipe.ingredient == ing
                    recipe.recipe
                end
            }
        }
    end

    def safe_recipes
        Recipe.all.reject {|recipe| recipe == unsafe_recipes}
    end

    def self.all
        @@all
    end
end

