class DivisionsController < ApplicationController
before_action :authorize, only: [:new, :create, :edit, :update, :destroy]

  def index
    @divisions = Division.all
    render :index
  end

  def new
    @division = Division.new
    render :new
  end

  def create
    @division = Division.new(division_params)
    if @division.save
      flash[:notice] = "Division successfully added!"
      redirect_to divisions_path
    else
      render :new
    end
  end

  def edit
    @division = Division.find(params[:id])
    render :edit
  end

  def show
    @division = Division.find(params[:id])
    render :show
  end

  def update
    @division= Division.find(params[:id])
    if @division.update(division_params)
      redirect_to divisions_path
    else
      render :edit
    end
  end

  def destroy
    @division = Division.find(params[:id])
    @division.destroy
    redirect_to divisions_path
  end

  private
    def division_params
      params.require(:division).permit(:div_name)
    end

end
