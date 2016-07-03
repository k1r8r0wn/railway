class StationsController < ApplicationController
  before_action :find_station, only: [:show, :edit, :update, :destroy]

  def index
    @stations = Station.all
  end

  def show; end

  def new
    @station = Station.new
  end

  def edit; end

  def create
    @station = Station.new(station_params)

    if @station.save
      redirect_to @station, notice: 'Station was successfully created.'
    else
      render :new
    end
  end

  def update
    if @station.update(station_params)
      redirect_to @station, notice: 'Station was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @station.destroy
    redirect_to stations_path, notice: 'Station was successfully destroyed.'
  end

  private

  def find_station
    @station = Station.find(params[:id])
  end

  def station_params
    params.require(:station).permit(:title, :arrival_time, :departure_time)
  end
end
