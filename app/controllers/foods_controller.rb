class FoodsController < ApplicationController
  include Authorize

  before_action :set_food, only: [:edit, :update, :destroy]

  def index
    @foods = Food.all.sorted
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      @food.move_to_top
      redirect_to foods_url, success: 'Food created successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @food.update_attributes(food_params)
      redirect_to edit_food_url(@food), success: 'Food updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @food.remove_from_list
    redirect_to foods_url, error: 'Food destroyed.' if @food.destroy
  end

  private

  def food_params
    params.require(:food).permit!
  end

  def set_food
    @food = Food.find_by(id: params[:id])
  end
end
