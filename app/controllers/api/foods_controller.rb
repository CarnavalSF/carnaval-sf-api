class API::FoodsController < ApplicationController
  def index
    foods = Food.all.sorted

    render jsonapi: foods,
      class: {
        Food: API::SerializableFood
      }
  end
end
