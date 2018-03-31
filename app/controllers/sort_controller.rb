class SortController < ApplicationController
  include Authorize

  # POST /sort
  def sort
    class_name = params[:class_name]
    sortable   = params[class_name.to_sym]

    sortable.each_with_index do |id, index|
      class_name.camelize.constantize.where(id: id).update_all(position: index+1)
    end
    
    head :ok
  end
end
