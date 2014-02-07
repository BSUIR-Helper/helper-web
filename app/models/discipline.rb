class Discipline < ActiveRecord::Base
  has_many :lector_disciplines
  has_many :lectors, :through => :lector_disciplines

  validate :name_or_abbr_exist

  def name_or_abbr_exist
    errors.add :base, 'Name or abbreviation must be set' if name.blank? and abbr.blank?
  end
end
