class MatchesController < ApplicationController

  def index
    @full_title = 'Matches'
    @matches = Match
    if params[:team_id]
      @matches = @matches.where(home_id: params[:team_id]).or(Match.where(away_id: params[:team_id]))
    end
    @matches = @matches.includes(:away, :home, :league, :venue).order(date: :desc).group_by(&:date)
  end

  def show
    @match = Match.find(params[:id])
  end
end
