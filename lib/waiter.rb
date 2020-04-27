require 'pry'
class Waiter

    attr_accessor :name, :years
    @@all = []
    def initialize(name, years)
        @name = name
        @years = years
        self.class.all << self 
    end 
    def self.all
        @@all
    end 

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end 

    def meals
        Meal.all.select do |meal|
            meal.waiter == self 
        end 
    end 

    def best_tipper
        tip = 0
        meal = meals[0]
        # binding.pry
        meals.map do |this_meal|
            if this_meal.tip >= tip
                tip = this_meal.tip
                meal = this_meal
            end 
        end 

        meal.customer
    end 

end