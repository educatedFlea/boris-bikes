require_relative 'bike'

class DockingStation 
  DEFAULT_CAPACITY = 20
  attr_reader :bike,:capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end
  
  # pop method: to remove the last element of the given array and returns the removed elements.
  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end 

  def dock(bike)
    fail 'Docking station is full' if full?
    @bikes << bike
    @bike = bike
  end 

  private 

  def full?
    @bikes.count >= capacity
  end 

  def empty?
    @bikes.empty?
  end 
end 

