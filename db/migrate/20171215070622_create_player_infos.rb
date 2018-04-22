class CreatePlayerInfos < ActiveRecord::Migration[5.1]
  def change
    create_table :player_infos do |t|
      t.references :player, foreign_key: true
      t.float :weight
      t.float :height
      t.integer :age
      t.integer :shirt_no
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
