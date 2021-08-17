class RegistrationsController < ApplicationController
  before_action :find_registration, only: [ :show, :edit, :update, :destroy ]

  def index
    @registrations = Registration.all
  end

  def show
    # @registration = registration.find(params[:id])
  end

  def new
    @planet = Planet.find(params[:planet_id])
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registrations_params)
    @planet = Planet.find(params[:planet_id])
    @registration.planet = @planet
    if @registration.save
      redirect_to registrations_path
    else
      render :new
    end
  end

  def edit
    # @registration = Registration.find(params[:id])
  end

  def update
    # @registration = Registration.find(params[:id])
    @registration.update(registrations_params)
    redirect_to registrations_path
  end

  def destroy
    # @registration = registration.find(params[:id])
    @registration.destroy
    redirect_to registrations_path
  end

  private

  def registrations_params
    params.require(:registrations).permit(:status, :price)
  end

  def find_registration
    @registration = Registration.find(params[:id])
  end
end
