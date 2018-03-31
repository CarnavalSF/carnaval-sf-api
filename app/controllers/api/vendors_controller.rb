class API::VendorsController < ApplicationController
  def index
    vendors = Vendor.all.sorted

    render jsonapi: vendors,
      class: {
        Vendor: API::SerializableVendor
      }
  end
end
