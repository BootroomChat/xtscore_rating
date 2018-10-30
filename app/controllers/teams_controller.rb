class TeamsController < ApplicationController

  def index
    @full_title = 'Teams'
    @teams = Team.all
    respond_to do |format|
      format.html
      format.json {render json: @teams}
    end
  end

  def show
    @team = Team.find(params[:id])
  end
end
