class Waiter
  attr_accessor :name, :experience

  @@all = []

  def initialize (name, experience)
    @name = name
    @experience = experience
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal (customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    #Meal.all = #<Meal:0x00007fc700a20bd8 @customer=#<Customer:0x00007fc700a20d90 @age=30, @name="Howard">, @tip=2, @total=15, @waiter=#<Waiter:0x00007fc700a20cf0 @experience=1, @name="Terrance">>
    #self = #<Waiter:0x00007fc700a20cf0 @experience=1, @name="Terrance">
    Meal.all.select {|meal| meal.waiter == self}
  end

  def best_tipper
    fattest_tip = 0
    fattest_tipper= nil
    meals.each do |meal|
      if meal.tip > fattest_tip
        fattest_tipper = meal.customer
        fattest_tip = meal.tip
      end
    end
    fattest_tipper
  end


end