class MatchesController < ApplicationController

  def index
    @full_title = 'Matches'
    @matches = Match.all.includes(:away, :home, :league, :venue).order(date: :desc).group_by(&:date)
  end

  def show
    @match = Match.find(params[:id])
  end
end
