class Vehicle
  def accelerate_to(_speed)
    raise NotImplementedError
  end

  def floor_it
    raise NotImplementedError
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
