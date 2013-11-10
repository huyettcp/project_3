class AddPlayerScoreInteger < ActiveRecord::Migration
  def change
    add_column :players, :cost_performance_score, :integer
  end
end
