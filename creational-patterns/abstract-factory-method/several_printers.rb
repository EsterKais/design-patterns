# Abstract Factory Pattern (with several factories)

# You can make the print collection button more flexible by adding an option to select a Printer.

# For the printer selection to work, you have to be careful and make sure that
# the commands to make the toys are the same across all printers. This means
# that all Printers need to have the `make_car` and `make_truck` methods, or
# the printer will spontaneously combust.

# Already know the Factory method? This would be the perfect opportunity to combine the
# Abstract Factory pattern with Factory method.

class Car
  def number_of_wheels
    "I have 4 wheels."
  end
end

class Truck
  def number_of_wheels
    "I have 6 wheels."
  end
end

class HighQualitySlowPrinter
  def self.make_car
    puts "Making a high quality car!"
    Car.new
  end

  def self.make_truck
    puts "Making a high quality truck!"
    Truck.new
  end
end

class LowQualityFastPrinter
  def self.make_car
    puts "Making a low quality car!"
    Car.new
  end

  def self.make_truck
    puts "Making a low quality truck!"
    Truck.new
  end
end

class Collection
  def initialize
    @cars = []
    @trucks = []
  end

  def produce(printer:, number_of_cars: 0, number_of_trucks: 0)
    number_of_cars.times do |car|
      @cars << printer.make_car
    end



    number_of_trucks.times do |truck|
      @trucks << printer.make_truck
    end
  end
end

Collection.new.produce(printer: LowQualityFastPrinter, number_of_cars: 2, number_of_trucks: 1)
Collection.new.produce(printer: HighQualitySlowPrinter, number_of_cars: 1, number_of_trucks: 2)
