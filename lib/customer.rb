require'pry'

class Customer
  attr_accessor :name, :age

  @@all = []

  def initialize (name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal (waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end

  def customer_meals
    Meal.all.select {|meal| meal.customer == self}
  end

  def meals
    #Meal = <Meal:0x00007fe7ce90d540 @customer=#<Customer:0x00007fe7ce90d8b0 @age=30, @cname="Howard">, @tip=2, @total=15, @waiter=#<Waiter:0x00007fe7ce90d680 @experience=1, @wname="Terrance">>
    #self = #<Customer:0x00007fd00f185330 @age=30, @name="Howard">
    customer_meals
  end

  def waiters
    #Meal = <Meal:0x00007fe7ce90d540 @customer=#<Customer:0x00007fe7ce90d8b0 @age=30, @cname="Howard">, @tip=2, @total=15, @waiter=#<Waiter:0x00007fe7ce90d680 @experience=1, @wname="Terrance">>
    #self = <Customer:0x00007feb1a8b57d8 @age=30, @name="Howard">
    customer_meals.map {|meal| meal.waiter}.uniq
    # binding.pry
  end
end