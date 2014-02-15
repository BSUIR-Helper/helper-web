require 'spec_helper'

describe User do
  it "is not admin by default" do
    user = User.new
    expect(user.admin?).to be_false
  end

  describe 'to_s' do
    it 'returns email when name is not set' do
      subject.email = 'asd@asd.asd'

      expect(subject.to_s).to eq(subject.email)
    end

    it 'returns name when email and name are set' do
      subject.email = 'asd@asd.asd'
      subject.name = 'Asd'

      expect(subject.to_s).to eq('Asd')
    end
  end
end
