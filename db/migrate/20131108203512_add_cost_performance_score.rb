class AddCostPerformanceScore < ActiveRecord::Migration
  def change
    add_column :players, :cost_performance_score, :float
  end
end
