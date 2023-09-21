class ListingsController < ApplicationController

    wrap_parameters include: Listing.attribute_names

    def create
        @listing = Listing.new(listing_params)

        if @listing.save
            render :show
        else
            render json: { errors: @listing.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def index
        @listings = Listing.all
        render :index
    end

    def show
        @listing = Listing.find_by(id: params[:id])
    end

    def update
        if @listing.update(listing_params)
            render :show
        else
            render json: @listing.errors.full_messages, status: 422
        end
    end

    def destroy
        @listing = Listing.find_by(id: params[:id])

        if @listing.host_id == current_user.id
            @listing.destroy
            render :index
        end
    end

    private

    def listing_params
        params.require(:listing).permit(
            :host_id,
            :host_id	, 
            :address, 
            :title,
            :description,
            :num_beds,
            :num_bedrooms,
            :number_bathrooms,
            :price,
            :has_ac,
            :has_wifi,
            :Pets_allowed,
            :has_washer_dryer,
            :latitude,
            :longitude
        )
    end


end
