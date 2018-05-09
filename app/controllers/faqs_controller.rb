class FaqsController < ApplicationController
  include Authorize

  before_action :set_faq, only: [:edit, :update, :destroy]

  def index
    @faqs = Faq.all.sorted
  end

  def new
    @faq = Faq.new
  end

  def create
    @faq = Faq.new(faq_params)

    if @faq.save
      @faq.move_to_top
      redirect_to faqs_url, success: 'Faq created successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @faq.update_attributes(faq_params)
      redirect_to faqs_url(@faq), success: 'Faq updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @faq.remove_from_list
    redirect_to faqs_url, error: 'Faq destroyed.' if @faq.destroy
  end

  private

  def faq_params
    params.require(:faq).permit!
  end

  def set_faq
    @faq = Faq.find_by(id: params[:id])
  end
end
