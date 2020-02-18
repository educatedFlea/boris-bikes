require 'docking_station'

describe DockingStation do 
  it "has 20 parking lots by default" do
    docking_station = DockingStation.new
    expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end  

  it "allow to change the default capacity" do
    docking_station = DockingStation.new(21)
    expect(docking_station.capacity).to eq 21
  end  

  describe '#release_bike' do 
  it 'release a bike' do
    bike = Bike.new
    subject.dock(bike) 
    expect(subject.release_bike).to eq bike
    end 

    it 'raises an error when there are no bikes availale' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end 
  end 


# docking_station = DockingStation.new
#   it "gets a bike" do
#    expect(docking_station.release_bike).to be_instance_of(Bike) 
#   end

it "a working bike" do
  bike = Bike.new
  expect(bike).to be_working
  end 

describe "#dock" do 
it "docks something" do 
  bike = Bike.new
  expect(subject.dock(bike)).to eq bike
end 

it "raises error when the dock is full" do 
  subject.capacity.times { subject.dock Bike.new }
  expect { subject.dock Bike.new}.to raise_error 'Docking station is full'
  end 
end 


it "should take one bike when docking" do
  expect(subject).to respond_to(:dock).with(1).argument
end 

it "return docked bikes" do
  bike = Bike.new
  subject.dock(bike)
  expect(subject.bike).to eq bike
end  

end 