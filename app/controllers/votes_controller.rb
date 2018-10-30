class VotesController < ApplicationController
  def index
  end

  def new
  end

  def create

    @vote = Vote.new(vote_params)
    @vote.user_id = current_user.id
    @vote.venue_id = params[:venue_id].to_i
    @vote.save
    @venue = Venue.find(params[:venue_id])
    @new_avg = @venue.votes.average(:rating).round
    @venue.update(avg_rating: @new_avg)
    redirect_to venue_path(params[:venue_id])
  end

  def show

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def vote_params
    params.require(:vote).permit(:rating, :review)
  end
end
