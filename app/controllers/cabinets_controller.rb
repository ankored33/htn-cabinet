class CabinetsController < ApplicationController
  def show
    @date = Date.today
    positions = POSITIONS
    cabinet = Cabinet.find_by(id: "1") #テスト用
    #cabinet = Cabinet.find_by(date: @date)
    @cabinet = {}
    positions.each do |k, v|
      @cabinet[v] = cabinet.send(k)
    end
  end
end
