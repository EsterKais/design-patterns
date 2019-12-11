# The Adapter Pattern

# Structural

# The adapter pattern is a design pattern
# (also known as wrapper, an alternative naming
# shared with the decorator pattern) that allows
# the interface of an existing class to be used as
# another interface.

# It is often used to make existing classes work
# with others without modifying their source code.


# Imagine we have a car interface that is quite
# complex but we need to use it in a new context
# called Vehicle, while not wanting to touch the
# car class.

class Car
  def floor_it(speed)
    "I am driving at #{speed} km/h.."
  end
end

# This is our adaptor that will create a smooth
# transition between Car and Vehicle. It takes the
# car instance as an argument.
class CarAdapter
  attr_reader :car

  def initialize(car)
    @car = car
  end

  # Here the `floor_it` method, that we want to access,
  # is wrapped in `speed_up_vehicle` method, giving it
  # the conditions to continue working from the Car class.
  def speed_up_vehicle(speed)
    car.floor_it(speed)
  end
end

# This is the new class we want to use within our system:
class Vehicle
  attr_reader :adapter

  def initialize(adapter)
    @adapter = adapter
  end

  def speed_up_vehicle(speed)
    adapter.speed_up_vehicle(speed)
  end
end

# So basically you create a car instance,
car = Car.new
# you pass that instance to the CarAdapter,
car_adapter = CarAdapter.new(car)
# which then can be passed into the Vehicle class,
vehicle = Vehicle.new(car_adapter)
# which then knows to run the `floor_it` method
# through `speed_up_vehicle`.
vehicle.speed_up_vehicle(120)
