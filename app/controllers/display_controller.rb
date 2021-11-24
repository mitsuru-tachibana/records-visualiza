class DisplayController < ApplicationController
  def visualize
    @class_name = params[:class_name]
    @records = params[:records]
    binding.pry
  end

  def compare
  end

  params.permit(:class_name, :records)
end