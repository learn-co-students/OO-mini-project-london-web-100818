class Recipe
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def add_ingredients(list_of_ingredients)
        list_of_ingredients.each { |i| RecipeIngredient.new(self, i) }
    end

    def recipe_cards
        # return user instances RecipeCards.all
        RecipeCard.all.select {|rc|
          rc.recipe == self
        }
    end

    def users
      recipe_cards.map { |card|
        card.user
      }
    end

    def recipe_ingredients
        # return ingredients of that recipe
        RecipeIngredient.all.select { |ri| ri.recipe == self }
    end

    def ingredients
      recipe_ingredients.map { |ri| ri.ingredient }
    end

    def allergen_ingredients
        Allergen.all.map { |allergen| allergen.ingredient} #array
    end

    def allergens
        #reurns an array of recipes that the user is not allergic to
        ingredients.each { |i|
            allergen_ingredients.map { |ing|
                if i == ing
                    i
                end
            }
        }.uniq
    end

    def self.all
        @@all
    end

    def self.most_popular
        # return recipe with highest number of users
    end

end
