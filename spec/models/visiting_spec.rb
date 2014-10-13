require 'spec_helper'

describe Visiting do

  before do
    @visiting = Visiting.new(user_id: 1, station_id: 1)
  end

  subject { @visiting }

  it { should respond_to(:user_id) }
  it { should respond_to(:station_id) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @visiting.user_id = nil }
    it { should_not be_valid }
  end

  describe "when station_id is not present" do
    before { @visiting.station_id = nil }
    it { should_not be_valid }
  end
end
