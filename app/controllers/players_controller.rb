class PlayersController < ApplicationController
  def index 
    
    @players = Player.where("team_id = 349").order("salary DESC") 
    respond_to do |format|
      format.html
      format.json {render :json => @players}
    end
  end

  def sorted
    @players = Player.where("team_id = 349").order("cost_performance_score DESC")
    respond_to do |format|
      format.html
      format.json {render :json => @players}
    end
  end
end

