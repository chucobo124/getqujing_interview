require 'test_helper'

RSpec::Matchers.define :be_multiple_with_others do |expected|
  match do |actual|
    # The function below is going to match the result with expected each by each
    answer = false
    expected.count.times do |index|
      result = expected.dup
      expect = 1
      result.delete_at(index)
      result.each do |index|
        expect = expect * index
      end
      # If find the answer is not true break the loop and return false
      answer = actual[index] == expect && actual[index] > 1
      unless answer
        break
      end
    end
    answer
  end
end

describe ProductArray do
  describe 'output' do
    let(:array_params) do
      Array.new(rand(6..10)) { rand(1..10_000) }
    end
    subject { ProductArray.output(array_params) }
    it { is_expected.to be_multiple_with_others(array_params) }
  end
end
