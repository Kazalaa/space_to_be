class Owner::PlanetsController < ApplicationController
skip_before_action :authenticate_user!, only: [ :index, :show ]
before_action :find_planet, only: [ :show, :edit, :update, :destroy ]

  def new
    @planet = Planet.new
  end

  def create
    @planet = Planet.new(planets_params)
    if @planet.save
      redirect_to owner_booking_path
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
    params.require(:planet).permit(:name, :rotation_period, :diameter, :climate, :gravity, :terrain, :surface_water, :population, :price)
  end

  def find_planet
    @planet = Planet.find(params[:id])
  end
end
