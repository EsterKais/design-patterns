# Strategy Method

# Behavioural Design

# The strategy pattern is useful for varying parts of an
# algorithm at runtime, similarly to the Template Method pattern.

# Unlike the Template Method, which uses inheritance to change
# part of the algorithm, Strategy uses Dependency Injection.

# https://medium.com/@joshsaintjacque/ruby-the-strategy-pattern-16c98b99b373

class Driver
  attr_reader :vehicle

  def initialize(vehicle)
    @vehicle = vehicle.new
  end

  def floor_it
    vehicle.acceletrate_to(speed)
  end
end

class Car
  def initialize
    # not relevant
  end

  def accelerate_to(speed)
    "I am accelerating to #{speed}!!"
  end
end

class Plane
  def initialize
    # not relevant
  end

  def accelerate_to(speed)
    "I'm flyin' fast at #{speed}!"
  end
end

# In this case, the `Car` and the `Plane` classes can
# do whatever else they want, the only thing they
# need to implement is the `accelerate_to` method,
# to ensure that the dependency injection in `Driver`
# remains working.
