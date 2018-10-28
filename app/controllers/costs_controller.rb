class CostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @costs = costs

    respond_to do |format|
      format.html { render :index }
      format.json { render :json => @costs.to_json(only: [:id, :category]) }
    end
  end

  def new
    @cost = Cost.new
  end

  def create
    cost = costs.new(cost_params)

    respond_to do |format|
      if cost.save
        format.html { redirect_to_ok }
        format.json { render :json => @costs.to_json(only: [:id, :category]) }
      else
        redirect_to_ng
      end
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
