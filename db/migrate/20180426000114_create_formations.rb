class CreateFormations < ActiveRecord::Migration[5.1]
  def change
    create_table :formations do |t|
      t.references :match, foreign_key: true
      t.references :team, foreign_key: true
      t.integer :captain_id
      t.integer :start_min
      t.integer :end_min
      t.integer :formation_index
      t.string :name
    end
  end
end
