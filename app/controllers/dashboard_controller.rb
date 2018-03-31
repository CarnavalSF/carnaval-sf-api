class DashboardController < ApplicationController
  include Authorize

  def index
    @sponsors = Sponsor.all.sorted
    @events = Event.all.sorted
    @faqs = Faq.all.sorted
    @foods = Food.all.sorted
    @vendors = Vendor.all.sorted
  end
end
