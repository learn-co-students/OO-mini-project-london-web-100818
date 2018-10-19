class Ingredient
    attr_accessor :name
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def allergens
      Allergen.all.select {|a|
        a.ingredient == self
      }
    end

    def allergen_count
      allergens.size
    end

    def self.most_common_allergen
        self.all.max_by {|ing| ing.allergen_count}
    end

    def self.all
        @@all
    end

end
