class FormationsController < ApplicationController
  def index
    @full_title = 'Formations'
    @formations = Formation.where(match_id: params[:match_id]).includes(:team, captain: :player_info, match: :match_stats,
                                                                        formation_locations: {player: :player_info})
                      .group_by {|formation| formation.team.name}
    respond_to do |format|
      format.html
      format.json {render json: @formations}
    end
  end
end
