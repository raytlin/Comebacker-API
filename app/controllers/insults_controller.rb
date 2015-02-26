class InsultsController < ApplicationController
  def create
  	text = params[:text]
  	insult = Insult.new(:text => text)
  	insult.save
  end

  def index
  	@insults = Insult.all.order("created_at DESC")
  	render :json => @insults
  end

  def show
  end

  def getComebacks
  	@comebacks = Comeback.where(:insult_id => params[:id].to_i).order("created_at DESC")
  	render :json => @comebacks
  end
end
