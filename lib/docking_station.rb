require_relative 'bike'

class DockingStation 
  DEFAULT_CAPACITY = 20
  # The :bike here is to access the argument of dock method (to return the value of the specific bike docked rather than the array)
  attr_reader :bike
  # attr_accessor can BOTH write and read an attribute 
  attr_accessor :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end
  
  # pop method: to remove the last element of the given array and returns the removed elements.
  def release_bike
    fail 'No bikes available' if empty?
    fail 'This bike is broken' if @bike.broken?
    @bikes.pop
  end 

  def dock(bike)
    fail 'Docking station is full' if full?
    @bikes << bike
    @bike = bike
  end 

  private 
  # The :bikes here because this attribute so far only need to be access by the private methods.
  attr_reader :bikes
  def full?
    @bikes.count >= capacity
  end 

  def empty?
    @bikes.empty?
  end 
end 