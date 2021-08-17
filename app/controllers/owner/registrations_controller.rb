class Owner::RegistrationsController < ApplicationController

  def index
    @registrations = []
    current_user.planets.each do |planet|
      planet.registrations.each do |registration|
        @registrations << registration
      end
    end
  end

  def show
    @registration = Registration.find(params[:id])
  end

  def edit
    @registration = Registration.find(params[:id])
  end

  def update
    @registration = Registration.find(params[:id])
    @registration.update(registrations_params)
    redirect_to registrations_path
  end

  def destroy
    @registration = registration.find(params[:id])
    @registration.destroy
    redirect_to registrations_path
  end

  private

  def registrations_params
    params.require(:registrations).permit(:status, :price)
  end

end
