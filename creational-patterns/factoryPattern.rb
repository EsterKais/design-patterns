# Factory Pattern

# Creational pattern

# The factory method pattern is a creational pattern
# that uses factory methods to deal with the problem of
# creating objects without having to specify the exact
# class of the object that will be created.

# This is done by creating objects by
# calling a factory method—either specified in
# an interface and implemented by child classes,
# or implemented in a base class and optionally
# overridden by derived classes—rather than by
# calling a constructor.

# https://en.wikipedia.org/wiki/Factory_method_pattern

# The Factory Method pattern relies on subclasses
# and therefore inheritance. Combining the Factory Method
# with the Template Pattern, is a nice way to ensure
# that the Factory pattern remains functional.

# https://medium.com/@dljerome/design-patterns-in-ruby-factory-method-e4e4cd995254
class Vehicle
  def accelerate_to(_speed)
    raise NotImplemented
  end

  def floor_it
    raise NotImplemented
  end
end

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
    accelerate_to(520)
  end
end

# Factory:
class VehicleFactory
  def create_vehicle(kind)
    case kind
    when "Car"
      Car.new
    when "Plane"
      Plane.new
    end
  end
end
