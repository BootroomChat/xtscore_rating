class CalculatorsController < ApplicationController
  def new
    @calculator = Calculator.new
  end


  def create
    @calculator = Calculator.new
    params.permit!
    @calculator.config = params['config']
    @calculator.save!
  end
end
