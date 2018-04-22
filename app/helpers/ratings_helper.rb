module RatingsHelper

  def stats_headers
    MatchStat.info_keys + MatchStat.stat_keys
  end

  def rating_headers(xt_rating)
    (XtRating.info_keys + %w(adjustedRating overallRating) +
        XtRating.position_mapping[xt_rating.xt_position].keys + MatchStat.xt_rating_keys).uniq
  end
end
