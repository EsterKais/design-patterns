# Decorator Pattern

# Structural Design

# https://www.youtube.com/watch?v=EHgET-LUwGQ
# http://ruby-doc.org/stdlib-2.2.1/libdoc/delegate/rdoc/SimpleDelegator.html

# In object-oriented programming, the decorator pattern
# is a design pattern that allows behavior to be added
# to an individual object, dynamically, without affecting
# the behavior of other objects from the same class.

# The decorator pattern is often useful for adhering
# to the Single Responsibility Principle, as it allows
# functionality to be divided between classes with
# unique areas of concern.

# https://en.wikipedia.org/wiki/Decorator_pattern

# Let's imagine that we have a car manufaturer
# that needs to know the color of the car before
# construction and the name of the future owner.
class Car
  attr_reader :color, :name

  def initialize(color, customer_name)
    @color = color
    @customer_name = customer_name
  end

  def construction_started
    Time.now
  end
end

# SimpleDelegator is a cool little functionality
# in Ruby that allows you to pass an instance of
# a class to the, in this case, decorator method
# without having to define a initilizer.
class CarDecorator < SimpleDelegator
  def starting_month
    construction_started.month
  end

  def last_name
    customer_name.split.last
  end
end

# This allowed us to keep our original Car class
# clean and let the decorator do the decorating.
car_for_order = Car.new("blue", "Ester Kais")
decorated_order = CarDecorator.new(car_for_order)
decorated_order.starting_month
decorated_order.last_name

# Another nice example was that when you have a
# fireplace, you do not change the fireplace to
# decorate it, you put things on it.
