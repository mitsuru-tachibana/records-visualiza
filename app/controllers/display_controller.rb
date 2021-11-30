# DBから取得したレコードを視覚的に表示する
class DisplayController < ApplicationController
  def visualize
    @class_name = params[:class_name]
    @records = params[:records]
    @rec_count = @records.to_unsafe_hash.length
  end

  def compare
  end

  def display_params
    params.permit(:class_name, records: {})
  end
end
