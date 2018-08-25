class CostsController < ApplicationController

  def index
    @costs = costs
    @cost = Cost.new
  end

  def new
  end

  def create
    cost = costs.new(cost_params)
    if cost.save
      redirect_to_ok
    else
      redirect_to_ng
    end
  end

  private

  def costs
    @costs ||= Cost.all
  end

  def cost
    @cost ||= Cost.find params[:id]
  end

  def cost_params
    params.require(:cost).permit(:category)
  end

  def redirect_to_ok
    redirect_to costs_path, notice: 'OK'
  end

  def redirect_to_ng
    redirect_to costs_path, notice: 'NG'
  end
end