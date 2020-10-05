class ApplicationController < ActionController::Base
    before_action :rankingposition
    before_action :lastschedulepoint
    before_action :allgeneraldatas

    def rankingposition
      @rankingposition = Ranking.pluck(:time).sort{|a, b| b <=> a}
    end

    def lastschedulepoint
      @lastschedule = Schedule.last.finished_at&.strftime("%d/%m/%Y")
    end

    def allgeneraldatas
      @rankings = Ranking.all
      @dayoffs = Dayoff.all
    end
end
