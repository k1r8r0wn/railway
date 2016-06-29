class CarriagesController < ApplicationController
  before_action :find_carriage, only: [:show, :edit, :update, :destroy]

  def index
    @carriages = Carriage.all
  end

  def show; end

  def new
    @carriage = Carriage.new
  end

  def edit; end

  def create
    @carriage = carriage_class.new(carriage_params)
    if @carriage.save
      redirect_to @carriage, notice: 'Carriage was successfully created.'
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage, notice: 'Carriage was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_path, notice: 'Carriage was successfully destroyed.'
  end

  private

  def find_carriage
    @carriage = Carriage.find(params[:id])
  end

  def carriage_params
    params.require(:carriage).permit(:carriage_type, :train_id, :upper_berths, 
                                     :lower_berths, :side_upper_berths, 
                                     :side_lower_berths, :sitting_berths)
  end

  def carriage_class
    params = carriage_params[:carriage_type]
    @carriage_class ||= Carriage::DESCENDANTS.include?(params) ? params.constantize : Carriage
  end
end
