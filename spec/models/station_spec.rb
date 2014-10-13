require 'spec_helper'

describe Station do

  before do
    @station = Station.new(name: "Ginza")
  end

  subject { @station }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @station.name = " " }
    it { should_not be_valid }
  end
end
