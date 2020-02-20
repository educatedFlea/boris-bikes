require 'docking_station'

RSpec.describe DockingStation do 
  describe 'initialization' do
    subject {DockingStation.new}
    let(:bike) { Bike.new }
    it 'defaults capacity' do 
      described_class::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error 'Docking station is full'
    end 
  end 
  # test if the docking station is created with 20 capacity by default
  # using Class::Const to access the constant 
  it 'has 20 parking lots by default' do
    docking_station = DockingStation.new
    expect(docking_station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end  

  # test if controller can change default capacity to accommodate busier area or less busy area
  it 'allows to change the default capacity' do
    docking_station = DockingStation.new(21)
    expect(docking_station.capacity).to eq 21
  end  

  it 'allows to change the default capacity' do
    docking_station = DockingStation.new(19)
    expect(docking_station.capacity).to eq 19
  end  

  #This is a nested describe for method 'release_bike'
  describe '#release_bike' do 
  # test if a bike can be release after docked 
  it 'release a bike' do
    bike = Bike.new
    subject.dock(bike) 
    expect(subject.release_bike).to eq bike
    end 

  # test if gaurd condition works 
    it 'raises an error when there are no bikes availale' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end 
  # replacing 'Bike.new' by 'double(:bike)'; mocking the behaviour of an instance
    let (:bike) { double :bike }
    it 'releases a working bike' do 
      allow(bike).to receive(:working?).and_return(true)
      subject.dock(bike)
      released_bike = subject.release_bike
      expect(released_bike).to be_working
    end 
  # Test for not releasing brokem bike BEFORE using doubles
    # it 'cannot release a broken bike' do
    #   docking_station = DockingStation.new 
    #   bike = Bike.new 
    #   bike.report_broken
    #   docking_station.dock(bike)
    #   expect{ docking_station.release_bike }.to raise_error 'This bike is broken'
    # end  
    it 'cannot release a broken bike' do
      bike = double(:bike, broken?:true)
      subject.dock bike
      expect{ subject.release_bike }.to raise_error 'This bike is broken'
    end  
  end 
  # end of nested describe

# This test is no longer needed
# docking_station = DockingStation.new
#   it "gets a bike" do
#    expect(docking_station.release_bike).to be_instance_of(Bike) 
#   end

# Nested describe for method 'dock'
  describe '#dock' do 
    it 'docks something' do 
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end 

    it 'raises error when the dock is full' do 
      subject.capacity.times { subject.dock double(:bike) }
      expect { subject.dock double(:bike)}.to raise_error 'Docking station is full'
    end 

    it 'should take one bike when docking' do
      expect(subject).to respond_to(:dock).with(1).argument
    end 

    it 'return docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end  
  end 
# end of nested describe 
end 
