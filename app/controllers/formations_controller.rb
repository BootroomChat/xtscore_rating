class FormationsController < ApplicationController
  def index
    @full_title = 'Formations'
    respond_to do |format|
      format.html
      format.json do
        @formations = Formation.where(match_id: params[:match_id]).includes(:match, :team, captain: :player_info,
                                                                            formation_locations: {player: :player_info})
                          .group_by {|formation| formation.team.name}
        render json: @formations
      end
    end
  end
end
