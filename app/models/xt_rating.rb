class XtRating < ApplicationRecord
  belongs_to :user
  belongs_to :match_stat

  delegate :xt_position, :player_position, to: :match_stat
  delegate *MatchStat.xt_rating_keys.map(&:underscore), to: :match_stat

  def username
    user ? user.name : 'N/A'
  end

  def user_rating
    self.class.position_mapping[xt_position].map do |key, percent|
      self.send(key.underscore).to_f * percent
    end.sum
  end

  def user_adjusted_rating
    user_rating * 0.6
  end

  def total
    user_adjusted_rating + adjusted_rating
  end

  def self.position_mapping
    {'FW' => {'offense' => 0.3, 'supporting' => 0.2, 'closingDown' => 0.1,
              'breakthrough' => 0.1, 'forwarding' => 0.1, 'offball' => 0.2},
     'AMC/SS' => {'offense' => 0.3, 'closingDown' => 0.1, 'breakthrough' => 0.1,
                  'forwarding' => 0.25, 'offball' => 0.15, 'organizing' => 0.2},
     'WF/IF' => {'breakthrough' => 0.3, 'crossing' => 0.15, 'closingDown' => 0.1,
                 'forwarding' => 0.1, 'offball' => 0.25, 'defenseParticipating' => 0.1},
     'CM/LCM/RCM' => {'forwarding' => 0.2, 'defenseParticipating' => 0.2, 'closingDown' => 0.2,
                      'offball' => 0.2, 'organizing' => 0.2},
     'DM' => {'defenseParticipating' => 0.35, 'forwarding' => 0.3, 'offball' => 0.1, 'organizing' => 0.25},
     'DL/DR' => {'defenseParticipating' => 0.5, 'crossing' => 0.2,
                 'offball' => 0.1, 'forwarding' => 0.1, 'closingDown' => 0.1},
     'DC' => {'marking' => 0.3, 'protecting' => 0.3,
              'aerial' => 0.3, 'passing' => 0.1},
     'GK' => {'pouncing' => 0.5, 'aerial' => 0.4,
              'defensiveOrganizing' => 0.1},
     'Sub' => {'attackingOverall' => 0.5, 'defensingOverall' => 0.5},
    }
  end


  def self.info_keys
    ['username', 'total', 'userAdjustedRating', 'userRating']
  end

  def self.stats_keys
    position_mapping.values.map(&:keys).flatten.uniq
  end

end
