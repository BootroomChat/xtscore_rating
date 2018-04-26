class MatchStat < ApplicationRecord
  belongs_to :match
  belongs_to :team
  belongs_to :position
  belongs_to :player

  delegate :xt_position, to: :position


  def self.info_keys
    %w(playerPosition)
  end

  def self.stat_keys
    %w(playMins result goals assists goalsConceded penaltyConceded cornersTotal aerialsWon dribblesLost shotsTotal passesAccurate tackleUnsuccesful defensiveAerials aerialsTotal offensiveAerials passesTotal throwInsTotal offsidesCaught interceptions ratings touches dispossessed parriedSafe claimsHigh clearances throwInAccuracy collected parriedDanger possession shotsOffTarget dribblesAttempted shotsOnPost dribblesWon cornersAccurate tackleSuccess throwInsAccurate dribbleSuccess errorsCount aerialSuccess shotsBlocked tacklesTotal tackleSuccessful shotsOnTarget dribbledPast passesKey foulsCommited totalSaves passSuccess claimsTotal)
  end

  def self.xt_rating_keys
    %w(adjustedRating overallRating parriedDangerRating cccPassesRating shotsAccuracyRating errorsRating goalsConcededRating dribbleSuccessRating aerialSuccessRating collectedRating totalSavesRating dribbledPastRating goalsRating defenseThreeRatting passesAccuracyRating)
  end

  def player_position
    "#{player}, #{position}(#{xt_position})"
  end
end
