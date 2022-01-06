# DBから取得したレコードを視覚的に表示する
class DisplayController < ApplicationController
  def visualize
    @class_name = params[:class_name]
    @records = params[:records]
    @rec_count = @records.to_unsafe_hash.length
  end

  def compare
    recs1 = params[:records1]
    recs2 = params[:records2]
    recs1_count = recs1.to_unsafe_hash.length
    recs2_count = recs2.to_unsafe_hash.length
    arr_length = if recs1_count < recs2_count
                   recs2_count
                 else
                   recs1_count
                 end
    @class_name = params[:class_name]
    @recs1_last_id = recs1["record#{recs1_count - 1}"]['0']['id']
    @recs2_last_id = recs2["record#{recs2_count - 1}"]['0']['id']
    @recs_arr = return_recs_arr(arr_length, recs1, @recs1_last_id, recs2, @recs2_last_id)
  end

  # rubocop:disable all
  def return_recs_arr(arr_length, recs1, recs1_last_id, recs2, recs2_last_id)
    recs_arr = []
    recs1_index = 0
    recs2_index = 0
    recs1_current_id = 0
    recs2_current_id = 0
    for i in 0..arr_length - 1
      recs1_current = recs1["record#{recs1_index}"]
      recs2_current = recs2["record#{recs2_index}"]
      # binding.pry
      if recs1_current.nil?
        recs_arr << [nil, recs2_current]
        # binding.pry
        recs2_index += 1
      elsif recs2_current.nil?
        recs_arr << [recs1_current, nil]
        # binding.pry
        recs1_index += 1
      else
        recs1_current_id = recs1_current['0']['id']
        recs2_current_id = recs2_current['0']['id']
        # binding.pry
        if recs1_current_id == recs2_current_id
          recs_arr << [recs1_current, recs2_current]
          recs1_index += 1
          recs2_index += 1
          # binding.pry
        elsif recs1_current_id > recs2_current_id
          recs_arr << [nil, recs2_current]
          recs2_index += 1
          # binding.pry
        elsif recs1_current_id < recs2_current_id
          recs_arr << [recs1_current, nil]
          recs1_index += 1
          # binding.pry
        end
      end
    end
    recs_arr
  end
  # rubocop:enable all

  def display_params
    params.permit(:class_name, records: {}, records1: {}, records2: {})
  end
end
