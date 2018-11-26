class Parcels
  attr_writer(:length, :width, :height, :weight, :speed)

  def initialize(length, width, height, weight, speed)
    @length = length
    @width = width
    @height = height
    @weight = weight
    @speed = speed
  end

  def volume()
    @volume = @length * @width * @height
  end

  def cost_to_ship
    cost = 0
    if @speed == "free"
      cost += 0
    elsif @speed == "standard"
      cost += 6
    elsif @speed == "two-day"
      cost += 10
    elsif @speed == "one-day"
      cost += 18
    end

    if @weight < 10
      cost += 5
    elsif @weight >= 10 && @weight < 25
      cost += 10
    elsif @weight >= 25
      cost += 15
    end

    if (@length >= 24) || (@width >= 24) || (@height >= 24)
      cost += 5
    else
      cost += 0
    end
  end
end

parcel = Parcels.new(3,4,5,16, "free")
