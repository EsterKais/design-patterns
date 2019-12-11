# Abstract Factory Pattern (with one factory)

# Imagine our Ruby classes are like blueprints.
# You have blueprints for two different types of toy vehicles: cars and trucks.
# You could define them as follows:

class Car # car blueprint
  def number_of_wheels
    "I have 4 wheels."
  end
end

class Truck # truck blueprint
  def number_of_wheels
    "I have 6 wheels."
  end
end

# At this point, you could make the car and the truck yourself by calling:
car = Car.new
truck = Truck.new

# and now we can check what the number of wheels of our created vehicles are:
car.number_of_wheels
truck.number_of_wheels

# Now, while it's wonderful to make things by hand, it's even cooler to let robots do it for us!
# So imagine that we have a 3D printer.

# The above blueprints allow the printer to produce these vehicles. We just need
# to teach the printer that if we ask it to make a car, it'll use the car
# blueprint and same for truck.

class Printer # our 3D printer
  # TIP! Using `.self` allows us to call `Printer.make_car` directly,
  # without having to initialize it with `Printer.new.make_car`.
  def self.make_car # using the Car blueprint
    Car.new
  end

  def self.make_truck # using the Truck blueprint
    Truck.new
  end
end

# So now, if you tell the 3D printer to make a car, it'll know how to do it and will do so!

car = Printer.make_car # ask the printer to make a car
truck = Printer.make_truck # ask the printer to make a truck

# Did the printer get it right though? Let's check!

car.max_speed
truck.max_speed

# Do our cars and trucks have the correct amount of wheels? Yes! Then the printer understood our commands correctly.

# Now imagine it's Christmas and you'd like to create a number of car and truck toys, but you don't want to
# stand at the printer and keep pressing on the button to create a car or a truck. You want to make a collection!

# If before we had to press a button to `make_car` or `make_truck`, now we'd like to have an option to
# specify how many cars and trucks we want and then press `print`!

class Collection
  def initialize
    @cars = []
    @trucks = []
  end

  def produce(number_of_cars: 0, number_of_trucks: 0)
    number_of_cars.times do |car|
      @cars << Printer.make_car
      puts "Made a car!"
    end

    number_of_trucks.times do |truck|
      @trucks << Printer.make_truck
      puts "Made a truck!"
    end
  end
end

# So this would be our print collection button
# where you choose the numer of cars and trucks you'd like to get printed:
Collection.new.produce(number_of_cars: 1, number_of_trucks: 2)
