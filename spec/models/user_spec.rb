require 'spec_helper'

describe User do
  it "is not admin by default" do
    user = User.new
    expect(user.admin?).to be_false
  end
end
