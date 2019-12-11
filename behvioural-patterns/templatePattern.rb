# Template method

# Behavioural Design

# The template method pattern is a behavioural design pattern that
# defines the program skeleton of an algorithm in an operation,
# deferring some steps to subclasses.

# It lets one redefine certain steps of an algorithm without
# changing the algorithm's structure.

# https://en.wikipedia.org/wiki/Template_method_pattern

# ********************************************************************

# You create a base class that sets up a template for other generators.
class Vehicle
  def accelerate_to(speed)
    raise NotImplemented
  end

  def floor_it
    raise NotImplemented
  end
end

# Then, you can use this template to create other classes that will
# inherit from this template.
class Car < Vehicle
  def accelerate_to(speed)
    "I am driving at #{speed} km/h.."
  end

  def floor_it
    accelerate_to(120)
  end
end

class Plane < Vehicle
  def accelerate_to(speed)
    "I am flying at #{speed} km/h.."
  end

  def floor_it
    accelerate_to(550)
  end
end
