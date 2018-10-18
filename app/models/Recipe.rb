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

    def users
        # return user instances RecipeCards.all
    end

    def ingredients
        # return ingredients of that recipe
    end

    def allergens
        # return all ingredeints in recipe that are allergens
    end

    def self.all
        @@all
    end

    def self.most_popular
        # return recipe with highest number of users
    end

end