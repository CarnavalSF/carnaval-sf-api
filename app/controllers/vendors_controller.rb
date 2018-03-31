class VendorsController < ApplicationController
  include Authorize

  before_action :set_vendor, only: [:edit, :update, :destroy]

  def index
    @vendors = Vendor.all.sorted
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)

    if @vendor.save
      @vendor.move_to_top
      redirect_to vendors_url, success: 'Vendor created successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @vendor.update_attributes(vendor_params)
      redirect_to edit_vendor_url(@vendor), success: 'Vendor updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @vendor.remove_from_list
    redirect_to vendors_url, error: 'Vendor destroyed.' if @vendor.destroy
  end

  private

  def vendor_params
    params.require(:vendor).permit!
  end

  def set_vendor
    @vendor = Vendor.find_by(id: params[:id])
  end
end
