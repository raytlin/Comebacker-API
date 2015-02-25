class DemoController < ApplicationController
  @instanceVar

  def index
  	@instanceVar = "this is stupid"
  	localVar = "this is a local var"
  	@searchQuery = params[:searchQuery]
  end
  def redirect
  	redirect_to("http://banana.herokuapp.com")
  end
end
