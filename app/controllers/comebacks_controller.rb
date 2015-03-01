class ComebacksController < ApplicationController
  def create
  	text = params[:text]
  	insult_id = params[:insult_id]

    #this lastcombackforinsultid is here to evaluate any dupes that tend to be sent by safari but
    #avoid the issue of not being able to submit the same text to 2 different insults consecitivly
  	lastComebackForInsultID = Comeback.where(:insult_id => insult_id).last
    if lastComebackForInsultID != nil 
      lastComebackForInsultIDtext = lastComebackForInsultID.text
      lastComebackForInsultIDID = lastComebackForInsultID.insult_id
    else
      lastComebackForInsultIDtext = nil
      lastComebackForInsultIDID = nil
    end

    if insult_id != nil && text != nil && text != lastComebackForInsultIDtext && insult_id != lastComebackForInsultIDID
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
