# DBから取得したレコードを視覚的に表示する
class DisplayController < ApplicationController
  def visualize
    @class_name = params[:class_name]
    @records = params[:records]
    @rec_count = @records.to_unsafe_hash.length
  end

  def compare
    @class_name = params[:class_name]
    @records1 = params[:records1]
    @records2 = params[:records2]
    @rec_count1 = @records1.to_unsafe_hash.length
    @rec_count2 = @records2.to_unsafe_hash.length
    binding.pry
  end

  def display_params
    params.permit(:class_name, records: {}, records1: {}, records2: {})
  end
end
