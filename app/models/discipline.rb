class Discipline < ActiveRecord::Base
  validate :name_or_abbr_exist

  def name_or_abbr_exist
    errors.add :base, 'Name or abbreviation must be set' if name.blank? and abbr.blank?
  end
end
