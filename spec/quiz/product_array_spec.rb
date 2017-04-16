require 'test_helper'

RSpec::Matchers.define :be_multiple_with_others do |expected|
  correct_result = []
  match do |actual|
    # The function below is going to match the result with expected each by each
    answer = false
    expected.count.times do |expect_index|
      result = expected.dup
      expect = 1
      result.delete_at(expect_index)
      result.each do |result_index|
        expect *= result_index
        correct_result << expect
      end
      # If find the answer is not true break the loop and return false
      answer = actual[expect_index] == expect
      break unless answer
    end
    answer
  end
  failure_message do |actual|
    "expected that #{actual} would be match #{correct_result}"
  end
end

describe ProductArray do
  describe 'output' do
    let(:array_params) do
      Array.new(rand(3..10)) { rand(1..10_000) }
    end
    subject { ProductArray.output(array_params) }
    it { is_expected.to be_multiple_with_others(array_params) }
    context 'when array have duplicate number' do
      let(:array_params) do
        duplicate_array = Array.new(rand(3..10)) { rand(1..10_000) }
        Array.new(rand(3..10)) { rand(1..10_000) }.concat(duplicate_array)
      end
      it { is_expected.to be_multiple_with_others(array_params) }
    end
    context 'when array\'s is irregular' do
      let(:array_params) { [] }
      it { is_expected.to eq [] }
    end
  end
end
