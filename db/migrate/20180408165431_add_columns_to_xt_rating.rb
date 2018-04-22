class AddColumnsToXtRating < ActiveRecord::Migration[5.1]
  def change
    add_column :xt_ratings, :attacking_overall, :decimal, precision: 12, scale: 6
    add_column :xt_ratings, :defensing_overall, :decimal, precision: 12, scale: 6
  end
end
