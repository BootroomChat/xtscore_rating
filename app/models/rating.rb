class Rating
  include ActiveModel::Model

  attr_accessor :match_id, :team_id
  attr_accessor :match, :team, :match_stats, :xt_ratings
  attr_accessor :username, :passcode

  def attributes=(attributes)
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def save
    xt_ratings.each(&:save)
  end

  def match
    @match ||= Match.find(match_id)
  end

  def team
    @team ||= Team.find(team_id)
  end

  def user
    @user ||= passcode == Rails.application.secrets.rating_password ? User.find_or_create_by(name: username) : nil
  end

  def match_stats
    @match_stats ||= MatchStat.where(match: match, team: team).includes(:position, :player)
  end

  def match_stats_by_player
    @match_stats_by_player ||= match_stats.map {|match_stat| [match_stat.player_id, match_stat]}.to_h
  end

  def all_xt_ratings
    @all_xt_ratings ||= match_stats.map {|match_stat| XtRating.includes(:match_stat, :user).where(match_stat: match_stat).where.not(user: nil)}
  end

  def xt_ratings
    @xt_ratings ||= match_stats.map {|match_stat| XtRating.includes(:match_stat, :user).find_or_initialize_by(match_stat: match_stat, user: user)}
  end

  def xt_ratings_attributes=(attributes)
    attributes.each do |i, xt_rating_params|
      xt_ratings[i.to_i].attributes = xt_rating_params
    end
  end
end
