class InstrumentsController < ApplicationController
  before_action :set_instrument, only: [:edit, :show, :update, :destroy]

  def index
    @instruments = current_user.instruments.all 
  end

  def show
  end

  def new
    @instrument = Instrument.new 
  end

  def create
    @instrument = current_user.instruments.new(instrument_params)
    if @instrument.save
      flash[:success] = "Instrument Added"
      redirect_to instruments_path
    else
      flash[:error] = "Error #{@instrument.errors.full_messages.join("\n")}"
      render :new 
    end
  end

  def edit

  end

  def update
    
    if @instrument.update(instrument_params)
      redirect_to instruments_path
    else
      render :edit
    end
  end

  def destroy
    @instrument.destroy
    redirect_to instruments_path
  end

  private 
  def instrument_params
    params.require(:instrument).permit(:name)
  end

  def set_instrument
    @instrument = current_user.instruments.find(params[:id])
  end
end
