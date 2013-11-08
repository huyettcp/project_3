class Player < ActiveRecord::Base
  attr_accessible :cost_performance_score, :home_run_cost, :name, :salary, :team_id, :win_cost
  belongs_to :team
end
