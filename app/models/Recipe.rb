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
        RecipeCard.all.select {|rc|
          rc.recipe == self
        }
    end

    def users
      recipe_cards.map { |card|  card.user}
    end

    def user_count
      users.length
    end

    def recipe_ingredients
        RecipeIngredient.all.select { |ri| ri.recipe == self }
    end

    def ingredients
      recipe_ingredients.map { |ri| ri.ingredient }
    end

    def allergen_ingredients
        Allergen.all.map { |allergen| allergen.ingredient} #array
    end

    def allergens
      Allergen.all
        .select { |a| (ingredients & allergen_ingredients)
        .include?(a.ingredient)}
        .map{|a| a.ingredient}.uniq
    end

    def self.all
        @@all
    end


    def self.most_popular
        most = self.all.max_by {|recipe| recipe.user_count}
        self.all.select { |recipe| recipe.user_count == most.user_count }
    end

end
