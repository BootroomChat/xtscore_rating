class Formation < ApplicationRecord
  belongs_to :match
  belongs_to :team
  belongs_to :captain, class_name: 'Player', foreign_key: :captain_id
  has_many :formation_locations

  def as_json(options = {})
    match_stats = match.match_stats.group_by(&:player_id)
    allXtRatings = XtRating.includes(:match_stat, :user).where(match_stat_id: match.match_stats.pluck(:id)).where.not(user: nil).group_by(&:player_id)
    locations = formation_locations.map do |location|
      xtRatings = allXtRatings[location.player.id]
      if xtRatings.present?
        rating = xtRatings.sum(&:total) / xtRatings.size
      else
        rating = match_stats[location.player.id].first.overall_rating.round(2)
      end

      {x: location.x, y: location.y,
       player_name: location.player.name.split(' ').last,
       shirt_no: location.player.shirt_no_str,
       ratings: [[rating, 5.0].max, 10.0].min}
    end
    {name: name, start_min: start_min, end_min: end_min, formation_index: formation_index,
     captain: {player_name: captain.name.split(' ').last, shirt_no: captain.shirt_no_str},
     locations: locations}
  end
end
