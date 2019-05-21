#my objects

class LasVegasEvent::Deal

  attr_accessor :name, :price, :location, :date_time, :url
  @@all =[]

  def initialize
  @name = name
  @price = price
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
