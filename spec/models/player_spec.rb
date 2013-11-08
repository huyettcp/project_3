require 'spec_helper'

describe Player do
  it { should allow_value(13.4).for(:cost_performance_score) }
  it { should allow_value(12356).for(:home_run_cost) }
  it { should allow_value("David Ortiz").for(:name) }
  it { should allow_value(123456).for(:salary) }
  it { should allow_value(1).for(:team_id) }
  it { should allow_value(124565344).for(:win_cost) }
end
