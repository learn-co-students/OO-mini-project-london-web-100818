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

    def ingredients

    end

    def unsafe_recipes
        #reurns an array of recipes that the user is not allergic to

        allergen_ingredients.each { |ing|
          RecipeIngredient.all.select { |ri|
                ri.ingredient == ing
            }
        }
    end

    def safe_recipes
      Recipe.all - steven.unsafe_recipes
    end

    def self.all
        @@all
    end
end
