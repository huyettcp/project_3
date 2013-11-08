require 'spec_helper'

describe Team do
  it { should allow_value("BOS").for(:abbreviation) }
  it { should allow_value(123456).for(:cost_per_win) }
  it { should allow_value(1).for(:league_id) }
  it { should allow_value("Boston Red Sox").for(:name) }
  it { should allow_value(124565344).for(:payroll) }
end
