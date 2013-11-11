class TeamsController < ApplicationController
  def index 
    @teams = Team.order("payroll DESC")
    respond_to do |format|
      format.html
      format.json {render :json => @teams}
    end
  end
end
