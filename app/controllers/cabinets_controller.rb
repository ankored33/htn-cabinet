class CabinetsController < ApplicationController
  def show
    @date = params[:date]
    @ministers = MINISTERS
  end
end
