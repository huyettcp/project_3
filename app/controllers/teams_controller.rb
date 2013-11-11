class TeamsController < ApplicationController
  def index 
    @teams = Team.all
    respond_to do |format|
      format.html
      format.json {render :json => @teams}
    end
  end
end
