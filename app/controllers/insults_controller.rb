class InsultsController < ApplicationController
  def create
  	@text = params[:text]
  	insult = Insult.new
  	insult.text = @text
  	if insult.save
  		redirect_to(:action => 'index')
  	end
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
