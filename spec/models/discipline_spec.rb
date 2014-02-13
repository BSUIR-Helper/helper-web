require 'spec_helper'

describe Discipline do
  it "doesn't save without name and abbr" do
    expect(subject.save).to be_false
  end

  it "saves with name only" do
    subject.name = "Mathematics"
    expect(subject.save).to be_true
  end

  it "saves with abbr only" do
    subject.abbr = "OAIP"
    expect(subject.save).to be_true
  end

  it "can't be removed if it has posts" do
    subject.posts << Fabricate(:post)
    subject.destroy
    expect(subject.destroyed?).to be_false
    expect(subject).to have(1).errors_on(:base)
  end

  it "can't be removed if it has lectors" do
    subject.lectors << Fabricate(:lector)
    subject.destroy
    expect(subject.destroyed?).to be_false
    expect(subject).to have(1).errors_on(:base)
  end

end
