class RankingsController < ApplicationController
    before_action :current_ranking, only: [:edit, :update, :show, :destroy]

  def index
    @rankings = Ranking.all
  end

  def show
    redirect_to schedules_path
  end

  def new
    @ranking = Ranking.new
  end

  def create
    if Ranking.create(ranking_params)
      redirect_to schedules_path, notice: 'Ranking criado com sucesso'
    else
      redirect_to schedules_path, alert: 'Não foi possível criar o Ranking'
    end
  end

  def edit

  end

  def update
    if @ranking.update(ranking_params)
      redirect_to schedules_path, notice: 'Ranking foi atualizado.'
    else
      redirect_to schedules_path, alert: 'Não foi possível atualizar o Ranking.'
    end
  end

  def destroy
    @ranking.destroy
    redirect_to schedules_path
  end
  
private

  def ranking_params
    params.require(:ranking).permit(:time, :id)
  end

  def current_ranking
    @ranking = Ranking.order(:id).last
  end
end