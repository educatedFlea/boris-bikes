require 'docking_station'

describe DockingStation do 
  # docking_station = DockingStation.new
  it { is_expected.to respond_to(:release_bike) }


docking_station = DockingStation.new
  it "gets a bike" do
   expect(docking_station.release_bike).to be_instance_of(Bike) 
  end

bike = docking_station.release_bike
  it "a working bike" do
  expect(bike.working?).to eq(true)
  end 
end 