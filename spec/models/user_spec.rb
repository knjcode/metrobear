require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     provider: "twitter", uid: "2233445566",
                     nickname: "kenji", image_url: "http://example.com/a.jpg",
                     trophies: ["Signup"])
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:admin) }
  it { should respond_to(:provider)}
  it { should respond_to(:uid)}
  it { should respond_to(:nickname)}
  it { should respond_to(:image_url)}
  it { should respond_to(:trophies)}

  it { should be_valid }
  it { should_not be_admin }

end
