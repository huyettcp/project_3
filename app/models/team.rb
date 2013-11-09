class Team < ActiveRecord::Base
  attr_accessible :abbreviation, :cost_per_win, :league_id, :name, :payroll
  belongs_to :league
  has_many :players
  validates_uniqueness_of :payroll
  validates_presence_of :payroll
end
