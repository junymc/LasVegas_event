#my objects

class LasVegasEvent::Deal

  attr_accessor :name, :location, :date_time, :events_description
  @@all =[]

  def initialize
  @name = name
  @location = location
  @date_time = date_time
  @events_description = events_description

  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

end
