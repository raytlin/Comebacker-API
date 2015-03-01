class ComebacksController < ApplicationController
  def create
  	text = params[:text]
  	insult_id = params[:insult_id]

  	if insult_id != nil && text != nil && test != Comeback.last.text
  		comeback = Comeback.new 
  		comeback.text = text
  		comeback.insult_id = insult_id.to_i
  		if comeback.save
  			render :json => Comeback.all.order("created_at DESC")
  		end
  	end

  end

  def index
  	@comebacks = Comeback.all.order("created_at DESC")
  	render :json => @comebacks
  end

  def show
  end
end
