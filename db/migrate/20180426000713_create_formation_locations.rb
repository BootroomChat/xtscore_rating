class CreateFormationLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :formation_locations do |t|
      t.references :formation, foreign_key: true
      t.references :match, foreign_key: true
      t.references :team, foreign_key: true
      t.references :player, foreign_key: true
      t.float :x
      t.float :y
    end
  end
end
