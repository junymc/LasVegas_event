#my objects

class LasVegasEvent::Deal

  attr_accessor :name, :location, :date_time, :url, :events_description
  @@all =[]

  def initialize(name, date_time, location, url, events_description=nil)
  @name = name
  @date_time = date_time
  @location = location
  @url = url
  @events_description = events_description
  save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

end
