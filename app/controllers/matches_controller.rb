class MatchesController < ApplicationController

  def index
    @full_title = 'Matches'
    @matches = Match
    if params[:team_id]
      @matches = @matches.where(home_id: params[:team_id]).or(Match.where(away_id: params[:team_id]))
    end
    @matches = @matches.paginate(page: params[:page], per_page: 20).includes(:away, :home, :league, :venue).order(date: :desc)
    @matches_by_date = @matches.group_by(&:date)
    respond_to do |format|
      format.html
      format.json {render json: @matches_by_date}
    end
  end

  def show
    @match = Match.find(params[:id])
  end
end
