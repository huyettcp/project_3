class AddCostPerformanceScoreToFloatAgain < ActiveRecord::Migration
  def change
    add_column :players, :cost_performance_score, :decimal
  end
end
