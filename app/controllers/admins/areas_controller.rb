class Admins::AreasController < ApplicationController
  before_action :authenticate_admin!

  def index
    @area = Area.new
    @areas = Area.all
  end

  def create
    @area = Area.new(area_params)
    if @area.save!
      flash[:notice]="You have creatad area successfully."
      redirect_back(fallback_location: root_path)
    else
      @areas = Area.all
      flash[:alert] = "Could not create area."
      render :index
    end
  end

  def edit
    @area = Area.find(params[:id])
  end

  def update
    @area = Area.find(params[:id])
    if @area.update(area_params)
      flash[:notice]="Area was successfully updated."
      redirect_to admins_areas_path
    else
      flash[:alert] = "Could not update."
      render :edit
    end
  end

  def destroy
    @area = Area.find(params[:id])
    if @area.destroy
      flash[:notice] = "Area was successfully destroyed."
      redirect_to admins_areas_path
    else
      flash[:alert] = "Could not destroy."
      redirect_back(fallback_location: root_path)
    end
  end


  private

  def area_params
    params.require(:area).permit(:area)
  end

end
