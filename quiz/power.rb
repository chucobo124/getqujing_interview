# Implement pow(x, n)

class Power
  # Process power
  #
  # @param [integer] number
  # @param [integer] multiply_time describe multiply_time
  # @return [integer] power result
  def process(number, multiply_time)
    result = number
    (multiply_time + 1).times do |_index|
      result *= number
    end
  end
end
