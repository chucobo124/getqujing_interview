# Implement int sqrt(int x).
#
# Compute and return the square root of x.

class SimpleRootSquare
  # Doing root square
  #
  # @param [integer] Number The number for root square
  # @return [integer] root square result
  def process(number)
    return 0 if number < 0
    result = 0
    maxium_bit = 1 << 14
    result >> 2 while result > number
    while maxium_bit != 0
      if number >= result + maxium_bit
        number -= result + maxium_bit
        result = (result >> 1) + maxium_bit
      else
        result = result >> 1
      end
      maxium_bit = maxium_bit >> 2
    end
    result
  end
end
