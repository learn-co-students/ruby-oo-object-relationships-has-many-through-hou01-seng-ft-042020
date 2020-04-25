require "pry"
require_relative "customer.rb"
require_relative "meal.rb"
require_relative "waiter.rb"

alex = Customer.new("Alex", 30)
rachel = Customer.new("Rachel", 27)
dan = Waiter.new("Dan", 3)
 
rachel.new_meal(dan, 50, 10)
alex.new_meal(dan, 30, 5)

rachel.meals#=> [#<Meal:0x00007fa23f1575a0 @waiter=#<Waiter:0x00007fa23f14fbe8 @name="Dan", @yrs_experience=22>, @customer=#<Customer:0x00007fa240987468 @name="Rachel", @age=27>, @total=50, @tip=10>]
rachel.meals.length #=> 1
 
Meal.all.length #=> 2

# binding.pry
# 0