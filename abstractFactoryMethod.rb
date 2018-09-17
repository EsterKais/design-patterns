# Abstract Factory Pattern

# Creational Pattern

# Provide an interface for creating _families_ of related
# or dependent objects without specifying their concrete classes.
# (as opposed to Factory method that creates a _single_ object)

# https://en.wikipedia.org/wiki/Abstract_factory_pattern

# https://bogdanvlviv.com/posts/ruby/patterns/design-patterns-in-ruby.html#abstract-factory
# https://medium.com/@dljerome/design-patterns-in-ruby-abstract-factory-82b74682e04e

class VehiclePark
  def initialize(vehicle_factory, number_of_cars: 0, number_of_trucks: 0)
    @cars = []

    number_of_cars.times do |car|
      @cars << VehcileFactory.make_car
    end

    @trucks = []

    number_of_cars.times do |car|
      @cars << VehcileFactory.make_truck
    end
  end

  def flooring_time
    @cars.each do { |car| car.floor_it }
    @trucks.each do { |truck| truck.floor_it }
  end
end

class VehcileFactory
  def make_car
    Car.new
  end

  def make_truck
    Truck.new
  end
end

class Car
  def floor_it
    "I am accelerating to 120km/h!!"
  end
end

class Truck
  def floor_it
    "I'm flyin' fast at 80km/h!"
  end
end
