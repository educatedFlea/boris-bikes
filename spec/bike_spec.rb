require 'docking_station'

describe Bike do
  it { is_expected.to respond_to(:working?) }

  it ' is a working bike' do
    bike = Bike.new
    expect(bike).to be_working
  end 

  it 'reports a broken bikes' do
    subject.report_broken
    expect(subject).to be_broken
  end
      
end 