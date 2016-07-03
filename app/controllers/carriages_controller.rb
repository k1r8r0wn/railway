class CarriagesController < ApplicationController
  before_action :find_carriage, only: [:show, :edit, :destroy]
  before_action :find_train, only: [:new, :create]
  before_action :find_carriage_with_class, only: [:update]

  def show; end

  def new
    @carriage = Carriage.new
  end

  def edit; end

  def create
    @carriage = carriage_class.new(carriage_params)
    @train.carriages << @carriage
    if @train.save
      redirect_to @train, notice: 'Carriage was successfully created.'
    else
      render :new
    end
  end

  def update
    @carriage.update(carriage_params)
    if @carriage.save
      redirect_to @carriage, notice: 'Carriage was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to @carriage.train, notice: 'Carriage was successfully destroyed.'
  end

  private

  def find_carriage
    @carriage = Carriage.find(params[:id])
  end

  def find_carriage_with_class
    @carriage = carriage_class.find(params[:id])
  end

  def find_train
    @train = Train.find(params[:train_id])
  end

  def carriage_params
    params.require(:carriage).permit(:carriage_type, :train_id, :upper_berths, 
                                     :lower_berths, :side_upper_berths, 
                                     :side_lower_berths, :sitting_berths)
  end

  def carriage_class
    carriage_type = carriage_params[:carriage_type]
    @carriage_class ||= (Carriage::AVAILABLE_CARRIAGES.include?(carriage_type) ? carriage_type.constantize : Carriage)
  end
end
