class SponsorsController < ApplicationController
  include Authorize

  before_action :set_sponsor, only: [:edit, :update, :destroy]

  def index
    @sponsors = Sponsor.all.sorted
  end

  def new
    @sponsor = Sponsor.new
  end

  def create
    @sponsor = Sponsor.new(sponsor_params)

    if @sponsor.save
      @sponsor.move_to_top
      redirect_to sponsors_url, success: 'Sponsor created successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @sponsor.update_attributes(sponsor_params)
      redirect_to sponsors_url(@sponsor), success: 'Sponsor updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @sponsor.remove_from_list
    redirect_to sponsors_url, error: 'Sponsor destroyed.' if @sponsor.destroy
  end

  private

  def sponsor_params
    params.require(:sponsor).permit!
  end

  def set_sponsor
    @sponsor = Sponsor.find_by(id: params[:id])
  end
end
