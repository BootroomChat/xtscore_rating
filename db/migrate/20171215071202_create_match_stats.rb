class CreateMatchStats < ActiveRecord::Migration[5.1]
  def change
    keys = %w(playMins result goals assists goalsConceded penaltyConceded cornersTotal aerialsWon dribblesLost shotsTotal passesAccurate tackleUnsuccesful defensiveAerials aerialsTotal offensiveAerials passesTotal throwInsTotal offsidesCaught interceptions ratings touches dispossessed parriedSafe claimsHigh clearances throwInAccuracy collected parriedDanger possession shotsOffTarget dribblesAttempted shotsOnPost dribblesWon cornersAccurate tackleSuccess throwInsAccurate dribbleSuccess errorsCount aerialSuccess shotsBlocked tacklesTotal tackleSuccessful shotsOnTarget dribbledPast passesKey foulsCommited totalSaves passSuccess claimsTotal)
    rating_keys = %w(adjustedRating overallRating parriedDangerRating cccPassesRating shotsAccuracyRating errorsRating goalsConcededRating dribbleSuccessRating aerialSuccessRating collectedRating totalSavesRating dribbledPastRating goalsRating defenseThreeRatting passesAccuracyRating)
    create_table :match_stats do |t|
      t.references :match, foreign_key: true
      t.references :team, foreign_key: true
      t.references :player, foreign_key: true
      t.references :position, foreign_key: true
      t.string
      (rating_keys + keys).each do |key|
          t.decimal key.underscore, precision: 12, scale: 6
      end
      t.timestamps
    end
  end
end
