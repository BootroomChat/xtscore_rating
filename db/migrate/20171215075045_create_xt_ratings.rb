class CreateXtRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :xt_ratings do |t|
      t.references :user, foreign_key: true
      t.references :match_stat, foreign_key: true
      XtRating.position_mapping.values.map(&:keys).flatten.uniq.each do |key|
        t.decimal key.underscore, precision: 12, scale: 6
      end
      t.timestamps
    end
  end
end
