#my objects

class LasVegasEvent::Deal

  attr_accessor :name, :location, :date_time, :url
  @@all =[]

  def initialize
  @name = name
  @location = location
  @date_time = date_time
  @url = url

  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

end
