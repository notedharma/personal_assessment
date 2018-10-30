class VenuesController < ApplicationController

  def index
    @venues = Venue.all

    @venues = Venue.filter(filter_venue_params) if params[:search].present?

    @venues = @venues.order(:updated_at).reverse_order.page(params[:page]).per(12)

  end

  def new
  end

  def marker_address
    # latitude and longitude reversed in geocoder reverse lookup
    results = Geocoder.search([params[:latitude].to_f, params[:longitude].to_f])
    @address = results.first.address
    render json: {address: @address}
  end


  def create
    @venue = Venue.new(venue_params)
    @venue.user_id = current_user.id
    @venue.save
    redirect_to venue_path(@venue.id)
  end

  def show
    @venue = Venue.find(params[:id])
    @votes = @venue.votes

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def venue_params
      params.require(:venue).permit(:name, :description, :address, :longitude, :latitiude, :contact, :phone, :category, :price )
    end

    def filter_venue_params
      params.require(:search).permit(:name, :address, :category, :price, :avg_rating)
    end

end
