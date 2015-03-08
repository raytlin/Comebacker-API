class InsultsController < ApplicationController
  def create
  	text = params[:text]
  	
  	if (text != nil && text != Insult.last.text && text != "")
	  	insult = Insult.new
	  	insult.text = text
	  	if insult.save
	  		render :json => Insult.all.order("created_at DESC")
	  	end
  	end
  end

  def index
  	insults = Insult.all.order("created_at DESC")
  	render :json => insults
  end
  
  def getLimitedTo 
    limit = params[:limit]
    insultsLimited = Insult.all.order("created_at DESC").limit(limit)
    render :json => insultsLimited
  end

  def show
  	insult_id = params[:id]
  	insult = Insult.find(insult_id)
  	render :json => insult
  end



  def getComebacksForInsultID
  	comebacks = Comeback.where(:insult_id => params[:id].to_i).order("created_at DESC")
  	render :json => comebacks
  end
end
