# [Creational patterns](https://sourcemaking.com/design_patterns/creational_patterns)

Creational design patterns deal with object creation mechanisms, by attempting to control [object creation](#object-creation).

# HELP! What are these fancy words?

## [What is object creation?](#object-creation)

Imagine you have a `car` class:

```ruby
class Car
  attr_accessor :color

  def initialize(color:)
    @color = color
  end
end
```

Then `Car.new(color: "red")` is object creation.

