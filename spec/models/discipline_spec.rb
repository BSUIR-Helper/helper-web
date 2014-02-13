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
end
