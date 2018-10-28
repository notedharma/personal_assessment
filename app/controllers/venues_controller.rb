class VenuesController < ApplicationController

  def index
    @venues = Venue.all

    @venues = Venue.filter(filter_venue_params) if params[:search].present?

    @venues = @venues.order(:updated_at)#.page(params[:page]).per(12)#
  end

  def new
  end

  def marker_address
    # latitude and longitude reversed in geocoder reverse lookup
    results = Geocoder.search([params[:latitude].to_f, params[:longitude].to_f])
    @address = results.first.address
    render json: {address: @address}

#
  end


  def create
    @venue = Venue.new(venue_params)
    @venue.user_id = current_user.id
    @venue.save
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

    def venue_params
      params.require(:venue).permit(:name, :description, :address, :longitude, :latitiude, :contact, :phone, :category, :price )
    end

    def filter_venue_params

    params.require(:search).permit(:name, :address, :category, :price)

    end

end
