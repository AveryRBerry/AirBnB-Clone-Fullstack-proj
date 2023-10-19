class Api::ReservationsController < ApplicationController

    def create
        @reservation = Reservation.new(reservation_params)

        if @reservation.save
            render :show
        else
            render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def index
        @reservations = current_user.reservations
        render :index
    end

    def show
        @reservation = Reservation.find_by(id: params[:id])
    end

    def update
        if @reservation.update(reservation_params)
            render :show
        else
            render json: @reservation.errors.full_messages, status: 422
        end
    end

    def destroy
        @reservation = Reservation.find_by(id: params[:id])

        if @reservation.host_id == current_user.id
            @reservation.destroy
            render :index
        end
    end


    private

    def reservation_params
        params.require(:reservations).permit(
        :listing_id,
        :guest_id,
        :num_guests,
        :total_price,
        :start_date,
        :end_date
        )
    end

end
