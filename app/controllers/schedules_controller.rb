class SchedulesController < ApplicationController
  before_action :current_schedule,  only: [:show, :edit, :update, :destroy]
  before_action :dayoffp , only: [:index, :update]
  before_action :now

  def index
    @schedule = Schedule.last if Schedule.last&.started_at&.to_date == Date.today
    
  end

  def show

  end

  def new
    @schedule = Schedule.new
  end

  def create  
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to schedules_path, notice: 'Criado com sucesso.'     
    else
      render action: :new, alert: 'Não foi possível salvar.' 
    end
  end

  def edit
    
  end

  def update
    @a = Schedule.second_to_last.finished_at.to_date + 1.days
    @b = Date.today

    case params[:status]
    when 'starting'
     @schedule.update(started_at: Date.today)
     redirect_to schedule_path, notice: 'Entrada marcada com sucesso.'
    when 'finishing'
      @schedule.update(finished_at: Date.today)

      if Schedule.last.present?
        (@a..@b).map(&:to_date).each do |date|
          unless date.strftime("%A") == "Saturday" || date.strftime("%A") == "Sunday" || date.in?(@dayoffp) || date == @b
            Ranking.create
            break
          end
        end
        ranking = Ranking.last
        ranking.update(time: ranking.time + 1)
      end
      redirect_to schedule_path, notice: 'Saída marcada com sucesso.'
    else
      redirect_to schedule_path, alert: 'Não foi possível atualizar o Ponto.'
    end
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

  def dayoffp
    @dayoffp = Dayoff.pluck(:vacantday).sort{|a, b| a <=> b}
  end

  def now
    @now = Date.today
  end

end

