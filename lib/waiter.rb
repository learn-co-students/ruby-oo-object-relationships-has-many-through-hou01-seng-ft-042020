# ./lib/waiter.rb
class Waiter
 
    attr_accessor :name, :yrs_experience
   
    @@all = []
   
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
   
    def self.all
      @@all
    end

    def new_meal(customer, total, tip)
      Meal.new(customer, self, total, tip)
    end

    def meals
      Meal.all.select do |meal|
        meal.waiter == self
      end 
    end 

    def best_tipper
      best_tipping_customer = nil
      highest_tip = 0
      Meal.all.map do |meal|
        if meal.tip > highest_tip 
          best_tipping_customer = meal.customer  
          highest_tip = meal.tip
        end
      end
      best_tipping_customer
    end 
   
  end