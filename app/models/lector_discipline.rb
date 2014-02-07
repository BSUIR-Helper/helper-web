class LectorDiscipline < ActiveRecord::Base
  belongs_to :lector
  belongs_to :discipline
end
