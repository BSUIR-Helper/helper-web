require 'test_helper'

class DisciplineTest < ActiveSupport::TestCase
  test "doesn't save without name and abbr" do
    discipline = Discipline.new
    assert !discipline.save, "Saved the discipline without a name"
  end

  test "saves with name only" do
    discipline = Discipline.new
    discipline.name = "Mathematics"
    assert discipline.save, "Didn't save the discipline without an abbr"
  end

  test "saves with abbr only" do
    discipline = Discipline.new
    discipline.abbr = "OAIP"
    assert discipline.save, "Didn't save the discipline without a name"
  end
end
