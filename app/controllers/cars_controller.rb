class CarsController < ApplicationController
  before_action :load_person

  def index
    @cars = @person.cars.all
  end

  def new
    @car = @person.cars.new
  end

  def create
    @car = @person.cars.new(car_params)
    if @car.save
      redirect_to person_path(@person.id)
    else
      render 'new'
    end
  end

  def show
    @car = @person.cars.find(params[:id])
  end

  def edit
    @car = @person.cars.find(params[:id])
  end

  def update
    @car = @person.cars.find(params[:id])
    if @car.update(car_params)
      redirect_to person_path(@person.id)
    else
      render 'edit'
    end
  end

  def destroy
    @car = @person.cars.find(params[:id])
    @car.destroy
    redirect_to person_path(@person.id)
  end

  private

  def car_params
    params.require(:car).permit(:name)
  end

  def load_person
    @person = Person.find(params[:person_id])
  end
end
