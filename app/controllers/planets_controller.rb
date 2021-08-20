class PlanetsController < ApplicationController
skip_before_action :authenticate_user!, only: [ :index, :show ]
before_action :find_planet, only: [ :show, :edit, :update, :destroy ]

  def index

    # @climate_array = []
    # Planet.all.each do |planet|
    #   @climate_array << planet.climate unless @climate_array.include?(planet.climate)
    # end

    if params[:query].present?
      @planets = Planet.search_by_name_and_terrain(params[:query])
    else
      @planets = Planet.all

      # if params[:planet_filters].present?
      #   climate_filter = params[:planet_filters][:climate]
      #   @planets = @planets.where(climate: climate_filter) unless climate_filter.empty?

      #   max_price_filter = params[:planet_filters][:max_price]
      #   @planets = @planets.where("planets.price <= :query ", query: max_price_filter) unless max_price_filter.empty?
      # end
    end
  end

  def show
    # @planet = Planet.find(params[:id])
  end

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(planets_params)
    if @planet.save
      redirect_to planets_path
    else
      render :new
    end
  end

  def edit
    # @planet = Planet.find(params[:id])
  end

  def update
    # @planet = Planet.find(params[:id])
    @planet.update(planets_params)
    redirect_to planets_path
  end

  def destroy
    # @planet = Planet.find(params[:id])
    @planet.destroy
    redirect_to planets_path
  end

  private

  def planets_params
    params.require(:planets).permit(:name, :rotation_period, :diameter, :climate, :gravity, :terrain, :surface_water, :population, :price, :photo)
  end

  def find_planet
    @planet = Planet.find(params[:id])
  end
end
