class CreateGoalDates < ActiveRecord::Migration[5.1]
  def change
    create_table :goal_dates do |t|
      t.references :task, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
