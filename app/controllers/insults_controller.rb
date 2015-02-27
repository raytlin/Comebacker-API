class InsultsController < ApplicationController
  def create
  	text = params[:text]
  	allInsults = Insult.all

  	#check all insults to make sure there are no repeats. this might be a big problem later on 
  	#this was only added bc it kept putting in repeats for some reason
  	allInsults.each do |i|

  	end
  	if text != nil 
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

  def show
  	insult_id = params[:id]
  	insult = Insult.find(insult_id)
  	render :json => insult
  end

  def getComebacks
  	comebacks = Comeback.where(:insult_id => params[:id].to_i).order("created_at DESC")
  	render :json => comebacks
  end
end
