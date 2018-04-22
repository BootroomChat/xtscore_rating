class RatingsController < ApplicationController
  def new
    @rating = Rating.new(match_id: params[:match_id], team_id: params[:team_id])
  end

  def index
    @rating = Rating.new(match_id: params[:match_id], team_id: params[:team_id])
  end

  def create
    @rating = Rating.new(match_id: params[:match_id], team_id: params[:team_id])
    params.permit!
    @rating.attributes = params['rating']
    @rating.save
    redirect_to match_url(params[:match_id])
  end
end
