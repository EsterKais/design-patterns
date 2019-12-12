# Factory Method (printer example)

# Continuing on the Abstract Factory Method, Factory Method is very similar,
# but adds more restrictions and also some safe guards to make sure the
# pattern doesn't get broken.


# So, we have two printers and you can see that there are similarities between
# what the printers are doing.

# Also, how would a developer know that this is the setup, each printer needs
# in order to work?

# That's where Factory Method can help out, when set up properly.

# So these were our two printers from the `several_printers` example.

class HighQualitySlowPrinter
  def self.make_car
    puts "Making a high quality car!"
  end

  def self.make_truck
    puts "Making a high quality truck!"
  end
end

class LowQualityFastPrinter
  def self.make_car
    puts "Making a low quality car!"
  end

  def self.make_truck
    puts "Making a low quality truck!"
  end
end

# Let's adjust them according to the Factory Method.

# Let's make a Printer class that defines both the methods that are a must
# for any kind of Printer to work:

class Printer
  def self.make_car
    # this ensures that the developer will see an error if they are
    # implementing another Printer class and don't define the methods
    # that are expected:
    raise NotImplementedError
  end

  def self.make_truck
    raise NotImplementedError
  end
end

# Then let's adjust our printers to use this class as their example, by using
# inheritance:

class HighQualitySlowPrinter < Printer
  def self.make_car
    puts "Making a high quality car!"
  end

  def self.make_truck
    puts "Making a high quality truck!"
  end
end

class LowQualityFastPrinter < Printer
  def self.make_car
    puts "Making a low quality car!"
  end

  def self.make_truck
    puts "Making a low quality truck!"
  end
end

# If we'd want to add another printer and we don't adhere to the rules set in the
# original Printer class:

class RoguePrinter < Printer
  def self.make_car
    puts "Making a rogue car!"
  end
end

# This is what would happen if we try to call `make_truck`:
RoguePrinter.make_car # would return `Making a rogue car!` as expected, but
RoguePrinter.make_truck # would throw a `NotImplementedError`.

# The cool thing about inheritance and the actual benefit of using it is
# to not repeat yourself and just easily share logic between classes:

# Let's bring back the base class:
class Printer
  def self.make_car
    raise NotImplementedError
  end

  def self.make_truck
    raise NotImplementedError
  end

  # and let's implement a method that can be shared across all it's children.
  # This time, instead of asking the method to throw an error if it's not
  # implemented, we ask it to do something instead.
  def self.notify
    "I am done printing!"
  end
end

# So lets bring back our Rogue printer. As you can see, nothing has changed.
# I have not added the `notify` method to the class:

class RoguePrinter < Printer
  def self.make_car
    puts "Making a rogue car!"
  end
end

# Now, when you call:
RoguePrinter.notify

# It will not error, but will return `"I am done printing!"`. Same for all the other
# printers, the `notify` method comes built in to all our printers now.

# However, a factory wouldn't be a factory without a factory to produce the objects:

class PrinterFactory
  def self.select_printer(quality:, speed:)
    case kind
    when quality == "high" && speed == "slow"
      HighQualitySlowPrinter
    when quality == "low" && speed == "high"
      LowQualityFastPrinter
    end
  end
end
