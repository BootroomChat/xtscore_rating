class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.date :date
      t.time :time
      t.string :file_path
      t.integer :home_id
      t.integer :away_id
      # !!!!!!!!!!!! BUG in sqlite
      # t.references :home_id, foreign_key: true, references: :teams
      # t.references :away_id, foreign_key: true, references: :teams
      t.references :venue, foreign_key: true
      t.references :league, foreign_key: true

      t.timestamps
    end
  end
end
