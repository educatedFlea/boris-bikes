require 'docking_station'

describe Bike do

  it 'reports a broken bikes' do
    subject.report_broken
    expect(subject).to be_broken
  end
      
end 