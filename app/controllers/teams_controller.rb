class TeamsController < ApplicationController

  def index
    @full_title = 'Teams'
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end
end
