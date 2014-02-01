require 'spec_helper'

describe Discipline do
  it "doesn't save without name and abbr" do
    discipline = Discipline.new
    expect(discipline.save).to be_false
  end

  it "saves with name only" do
    discipline = Discipline.new
    discipline.name = "Mathematics"
    expect(discipline.save).to be_true
  end

  it "saves with abbr only" do
    discipline = Discipline.new
    discipline.abbr = "OAIP"
    expect(discipline.save).to be_true
  end
end
