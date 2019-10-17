class PersonsController < ApplicationController
  def index
    @persons = Person.all
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if @person.save
      redirect_to persons_path
    else
      render 'new'
    end
  end

  def show
    @person = Person.find(params[:id])
    @cars = @person.cars
  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update(person_params)
      redirect_to persons_path
    else
      render 'edit'
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to persons_path
  end

  def report
    @persons = Person.all.includes(:cars)

    respond_to do |format|
      format.html
      format.json do
        render json: @persons.as_json('report')
      end
    end
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name)
  end
end
