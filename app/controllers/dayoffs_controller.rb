class DayoffsController < ApplicationController
  before_action :current_dayoff, only: [:show, :edit, :update, :destroy]
  before_action :alldaysoff
  before_action :nextday

    def index
      
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

    def alldaysoff
     @dayoffs = Dayoff.all.sort_by &:vacantday
    end

    def nextday
      b = Dayoff.pluck(:vacantday).sort.reverse
      b.each do |lastest|
        if lastest >= Date.today
        @lastest = lastest
        end
      end
    end

  end
  