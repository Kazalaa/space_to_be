class PlanetsController < ApplicationController
skip_before_action :authenticate_user!, only: [ :index, :show ]
before_action :find_planet, only: [ :show, :edit, :update, :destroy ]

  def index
    if params[:query].present?
      @planets = Planet.search_by_name_and_terrain(params[:query])
    else
      @planets = Planet.all
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
