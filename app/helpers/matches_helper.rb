module MatchesHelper
  def stats_headers
    MatchStat.info_keys + MatchStat.stat_keys
  end

  def xt_ratings_headers
    MatchStat.info_keys + MatchStat.xt_rating_keys
  end

  def headers
    {'Stats' => stats_headers, 'XT Rating' => xt_ratings_headers}
  end
end
