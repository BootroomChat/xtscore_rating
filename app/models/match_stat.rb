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
    %w(playMins result goals assists goalsConceded penaltyConceded cornersTotal aerialsWon dribblesLost shotsTotal passesAccurate tackleUnsuccesful defensiveAerials aerialsTotal offensiveAerials passesTotal throwInsTotal offsidesCaught tackleSuccessful interceptions ratings touches dispossessed parriedSafe claimsHigh clearances collected parriedDanger possession shotsOffTarget dribblesAttempted shotsOnPost dribblesWon cornersAccurate throwInsAccurate errorsCount shotsBlocked tacklesTotal shotsOnTarget dribbledPast passesKey foulsCommited totalSaves claimsTotal)
  end

  def self.ignore_keys
    %w(tackleSuccess tackleSuccess dribbleSuccess aerialSuccess passSuccess throwInAccuracy)
  end

  def self.xt_rating_keys
    %w(adjustedRating overallRating parriedDangerRating cccPassesRating shotsAccuracyRating errorsRating goalsConcededRating dribbleSuccessRating aerialSuccessRating collectedRating totalSavesRating dribbledPastRating goalsRating defenseThreeRatting passesAccuracyRating)
  end

  def player_position
    "#{player}, #{position}(#{xt_position})"
  end
end
