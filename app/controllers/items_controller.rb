class ItemsController < ApplicationController

  def index

  end

  def show
    @cost = Cost.find params[:id]
    @items = @cost.items
    @summary = @items.sum(:sum).round(2)

    respond_to do |format|
      format.html { render :show }
      format.json { render :json => @items.to_json }
    end
  end

  def create
    cost = Cost.find params[:item][:cost_id]
    item = cost.items.new(item_params)
    item.sum = params[:item][:mount].to_i * params[:item][:price].to_i

    respond_to do |format|
      if item.save
        format.html { redirect_to_ok(cost) }
        format.json { render :json => item.to_json }
      else
        redirect_to_ng(cost)
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :mount, :price, :sum, :notice)
  end

  def redirect_to_ok(cost)
    redirect_to item_path(cost), notice: 'OK'
  end

  def redirect_to_ng(cost)
    redirect_to item_path(cost), notice: 'NG'
  end
end