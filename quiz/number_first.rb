# Number first
#
# Given an array nums, write a function to move all non-zero numbers to the head
# of it while maintaining the relative order of the non-zero numbers.
#
# For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums
# should be [1, 3, 12, 0, 0].
#
# Note: You must do this in-place without making a copy of the array. Minimize
# the total number of operations.

class NumberFirst
  # Srot the array in special ordering
  #
  # @param [Array] array a list of array
  # @return [Array] An Array in special ordering
  def self.sorting(array)
    cache_block = array.count
    array.count.times do |index|
      if array[index] == 0
        (array.count - 1 - index).times do |change_index|
          switch_index = index + change_index
          next if array[switch_index] == 0
          array[cache_block] = array[index]
          array[index] =  array[switch_index]
          array[switch_index] = array[cache_block]
          break
        end
      end
    end
    array.delete_at(cache_block)
    array
  end
end
