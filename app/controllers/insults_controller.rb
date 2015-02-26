class InsultsController < ApplicationController
  def create
  end

  def index
  	@insults = Insult.all.order("created_at DESC")
  	render :json => @insults
  end

  def show
  end

  def comebacks
  	@comebacks = Comeback.where(:insult_id => params[:id].to_i).order("created_at DESC")
  	render :json => @comebacks
  end
end
