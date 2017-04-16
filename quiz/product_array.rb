class ProductArray
  # Given an array of n integers where n > 1, nums, return an array output such
  # that output[i] is equal to the product of all the elements of nums except
  # nums[i].
  #
  # Solve it without division and in O(n).
  #
  # For example, given [1,2,3,4], return [24,12,8,6].

  # Return the an array what can multiply other numbers without index itself.
  #
  # @param [Array] array array numbers
  # @return [Array] multiply result
  def self.output(array)
    return [] unless array.count >= 1
    result_array = Array.new(array.count) do |index|
      result = 1
      multiply_array = array.dup
      multiply_array.delete_at(index)
      multiply_array.each do |number|
        result *= number
      end
      result
    end
    result_array
  end
end
