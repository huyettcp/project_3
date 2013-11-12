class PlayersController < ApplicationController
  def index 
    @players = Player.order("salary DESC")
    respond_to do |format|
      format.html
      format.json {render :json => @players}
    end
  end
end