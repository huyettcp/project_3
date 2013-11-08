class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :abbreviation
      t.integer :payroll
      t.integer :cost_per_win
      t.integer :league_id

      t.timestamps
    end
  end
end
