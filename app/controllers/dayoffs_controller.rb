class DayoffsController < ApplicationController
    before_action :current_dayoff, only: [:show, :edit, :update, :destroy]
  
    def index
      @dayoffs = Dayoff.all
    end
  
    def show
  
    end
  
    def new
      @dayoff = Dayoff.new
    end
  
    def create
      @dayoff = Dayoff.create(dayoff_params)
      redirect_to dayoffs_path
    end
  
    def edit
  
    end
  
    def update
      @dayoff.update(dayoff_params)
      redirect_to dayoff_path(@dayoff)
    end
  
    def destroy
      @dayoff.destroy
      redirect_to dayoffs_path
    end
  
  private
  
    def dayoff_params
      params.require(:dayoff).permit(:vacantday, :id)
    end
  
    def current_dayoff
      @dayoff = Dayoff.find(params[:id])
    end
    
  end
  