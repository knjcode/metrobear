require 'spec_helper'

describe User do

  before do
    @user = User.new(provider: "twitter", uid: "2233445566",
                     nickname: "kenji", image_url: "http://example.com/a.jpg",
                     trophies: ["Signup"])
  end

  subject { @user }

  it { should respond_to(:provider)}
  it { should respond_to(:uid)}
  it { should respond_to(:nickname)}
  it { should respond_to(:image_url)}
  it { should respond_to(:trophies)}

  it { should be_valid }

end
