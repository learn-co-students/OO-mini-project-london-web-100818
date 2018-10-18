class Ingredient
    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name     
        @@all << self
    end

    def self.most_common_allergen
        #returns most common allergen(highest number of users)
    end

    def self.all
        @@all
    end
end
