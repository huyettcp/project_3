class ChangeCostPerformanceScoreToFloat < ActiveRecord::Migration
  def change
    remove_column :players, :cost_performance_score
  end
end
