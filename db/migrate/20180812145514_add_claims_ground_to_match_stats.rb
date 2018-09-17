class AddClaimsGroundToMatchStats < ActiveRecord::Migration[5.1]
  def change
	    add_column :match_stats, :claims_ground, :decimal, precision: 12, scale: 6
  end
end
