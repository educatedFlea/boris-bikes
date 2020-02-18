require 'docking_station'

describe DockingStation do 
  # docking_station = DockingStation.new
  it { is_expected.to respond_to(:release_bike) }


# docking_station = DockingStation.new
#   it "gets a bike" do
#    expect(docking_station.release_bike).to be_instance_of(Bike) 
#   end

it "a working bike" do
  bike = subject.release_bike
  expect(bike).to be_working
  end 

it "docks something" do 
  bike = Bike.new
  expect(subject.dock(bike)).to eq bike
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