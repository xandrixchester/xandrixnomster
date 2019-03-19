class PlacesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def index
		# .pagiinate(page: params[:page], per_page: 1 "change how many you want each page to show")
		@places = Place.all.order("created_at DESC").paginate(page: params[:page], per_page: 1)
	end

	def new
		@place = Place.new
	end

	def create
		current_user.places.create(place_params)
		redirect_to root_path
	end

	def show
		@place = Place.find(params[:id])
	end

	def edit
			@place = Place.find(params[:id])
	end

	def update
		@place = Place.find(params[:id])
		@place.update_attributes(place_params)
		redirect_to root_path
	end

	def destroy
		@place = Place.find(params[:id])
		@place.destroy
		redirect_to root_path
	end

	private

	def place_params
		params.require(:place).permit(:name, :description, :address)
	end


end
