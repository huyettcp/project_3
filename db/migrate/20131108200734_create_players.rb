class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :salary
      t.integer :cost_performance_score
      t.integer :home_run_cost
      t.integer :win_cost
      t.integer :team_id

      t.timestamps
    end
  end
end
