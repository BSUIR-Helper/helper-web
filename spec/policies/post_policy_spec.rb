require 'spec_helper'

describe PostPolicy do
  subject { PostPolicy.new(user, Fabricate(:post)) }

  context "for a visitor" do
    let(:user) { nil }

    it { expect(subject).to permit(:show) }
    it { expect(subject).to permit(:index) }
    it { expect(subject).not_to permit(:create) }
    it { expect(subject).not_to permit(:new) }
    it { expect(subject).not_to permit(:update) }
    it { expect(subject).not_to permit(:edit) }
    it { expect(subject).not_to permit(:destroy) }
  end

  context "for a user" do
    let(:user) { Fabricate(:user) }

    it { expect(subject).to permit(:show) }
    it { expect(subject).to permit(:index) }
    it { expect(subject).to permit(:create) }
    it { expect(subject).to permit(:new) }
    it { expect(subject).not_to permit(:update) }
    it { expect(subject).not_to permit(:edit) }
    it { expect(subject).not_to permit(:destroy) }
  end

  context "for a user" do
    let(:user) { Fabricate(:admin) }

    it { expect(subject).to permit(:show) }
    it { expect(subject).to permit(:index) }
    it { expect(subject).to permit(:create) }
    it { expect(subject).to permit(:new) }
    it { expect(subject).to permit(:update) }
    it { expect(subject).to permit(:edit) }
    it { expect(subject).to permit(:destroy) }
  end

end
