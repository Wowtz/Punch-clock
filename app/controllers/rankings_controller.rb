class RankingsController < ApplicationController
  before_action :current_ranking, only: [:edit, :update, :show, :destroy]
  def index
    @rankings = Ranking.all
  end

  def show

  end

  def new
    @ranking = Ranking.new
  end

  def create
    ranking = Ranking.create(ranking_params)
    redirect_to rankings_path
  end

  def edit

  end

  def update
    @ranking.update(ranking_params)
    redirect_to rankings_path
  end

  def destroy
    @ranking.destroy
    redirect_to rankings_path
  end

  def engage
    @start = Time.now
  end
  
  def elapsed_time
   now = Time.now
   elapsed = (now - @start)
   @start = Time.now
  end
  
private

  def ranking_params
    params.require(:ranking).permit(:time)
  end

  def current_ranking
    @ranking = Ranking.find(params[:id])
  end
end

############################################################
class Cronometro
  
def initialize()
  @start = Time.now
end

def elapsed_time
 now = Time.now
 elapsed = (now - @start)
end

end