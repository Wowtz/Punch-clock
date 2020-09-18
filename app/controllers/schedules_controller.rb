class SchedulesController < ApplicationController
    before_action :current_schedule,  only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.all
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def create
    schedule = Schedule.create(schedule_params)
    redirect_to schedules_path
  end

  def edit
 
  end

  def update
    @schedule.update(schedule_params)
    redirect_to schedule_path
  end

  def destroy
    @schedule.destroy
    redirect_to schedules_path
  end 

private

    def schedule_params
    params.require(:schedule).permit(:started_at, :finished_at, :id)
    end

    def current_schedule
        @schedule = Schedule.find(params[:id])
    end
end