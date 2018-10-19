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
        recipes[-1]
    end

    def allergen_ingredients
        allergens.map{ |allergen| allergen.ingredient}
    end

    def ingredients
      RecipeIngredient.all.map{|ri| ri.ingredient}
    end

    def unsafe_recipes
      RecipeIngredient.all
        .select {|ri| (ingredients & allergen_ingredients)
        .include?(ri.ingredient)}
        .map {|ri| ri.recipe}.uniq
    end

    def safe_recipes
      Recipe.all - self.unsafe_recipes
    end

    def self.all
        @@all
    end
end
