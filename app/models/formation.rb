class Formation < ApplicationRecord
  belongs_to :match
  belongs_to :team
  belongs_to :captain, class_name: 'Player', foreign_key: :captain_id
  has_many :formation_locations, dependent: :destroy

  def as_json(options = {})
    match_stats = match.match_stats.group_by(&:player_id)
    all_xt_ratings = XtRating.includes(:match_stat, :user).where(match_stat_id: match.match_stats.pluck(:id)).where.not(user: nil).group_by {|xt| xt.match_stat.player_id}
    locations = formation_locations.map do |location|
      xt_ratings = all_xt_ratings[location.player.id]
      if xt_ratings.present?
        rating = (xt_ratings.sum(&:total) / xt_ratings.size).round(2)
      else
        rating = match_stats[location.player.id].first.overall_rating.round(2)
      end

      {x: location.x, y: location.y,
       player_name: location.player.last_name,
       shirt_no: location.player.shirt_no,
       ratings: [[rating, 5.0].max, 10.0].min}
    end
    {name: name, start_min: start_min, end_min: end_min, formation_index: formation_index,
     captain: {player_name: captain.last_name, shirt_no: captain.shirt_no},
     locations: locations}
  end
end
