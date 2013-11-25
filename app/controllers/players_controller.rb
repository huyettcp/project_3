class PlayersController < ApplicationController
  def index 
    
    @players = Player.where("team_id = 16").order("salary DESC") 
    respond_to do |format|
      format.html
      format.json {render :json => @players}
    end
  end

  def salary_data
    team_id = params[:team_id]
    @players = Player.where("team_id = #{team_id}").order("salary DESC") 
    respond_to do |format|
      format.html
      format.json {render :json => @players}
    end
  end

  def cost_performance_data
    team_id = params[:team_id]
    @players = Player.where("team_id = #{team_id}").order("cost_performance_score DESC") 
    respond_to do |format|
      format.html
      format.json {render :json => @players}
    end
  end

  def individual_player_data
    name = params[:name]
    @player = Player.where("name = '#{name}'")
    respond_to do |format|
      format.html
      format.json {render :json => @player}
    end

  end
end

