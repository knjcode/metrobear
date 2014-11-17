require 'spec_helper'

describe Comment do

  before do
    @comment = Comment.new(user_id: 1, station_id: 1, nickname: "test", content: "comment")
  end

  subject { @comment }

  it { should respond_to(:user_id) }
  it { should respond_to(:station_id) }
  it { should respond_to(:nickname) }
  it { should respond_to(:content) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @comment.user_id = nil }
    it { should_not be_valid }
  end

  describe "when station_id is not present" do
    before { @comment.station_id = nil }
    it { should_not be_valid }
  end

  describe "when content is not present" do
    before { @comment.content = nil }
    it { should_not be_valid }
  end

end
