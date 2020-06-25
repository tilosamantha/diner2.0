class Api::ItemsController < ApplicationController
  before_action :set_menu
  def index
    render json: @menu.items
  end
  def create
    @item = @menu.items.new(item_params)
    if @item.save
      render json: @item
    else
      render json: { errors: @item.errors }, status: :unprocessable_entity
    end
  end
  def update
    @item = @menu.items.find(params[:id])
    if @item.update(item_params)
      render json: @item
    else
      render json: { errors: @item.errors }, status: :unprocessable_entity
    end
  end
  def destroy
    @menu.items.find(params[:id]).destroy
    render json: { message: 'item is deleted' }
  end
  private
    def item_params
      params.require(:item).permit(:name, :price)
    end
    def set_menu
      @menu = Menu.find(params[:menu_id])
    end
end