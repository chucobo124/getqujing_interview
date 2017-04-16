require 'spec_helper'

RSpec.describe NumberFirst do
  describe '#self.sorting' do
    let(:array_params) { [0, 1, 0, 3, 12] }
    subject { NumberFirst.sorting(array_params) }
    it { is_expected.to eq [1, 3, 12, 0, 0] }
    context 'when number has negative number' do
      let(:array_params) { [0, 0, -1, 1, 0, 3, 12] }
      it { is_expected.to eq [-1, 1, 3, 12, 0, 0, 0] }
    end
    context 'when array is alreday sorting' do
      let(:array_params) { [3, 12, 0, 0, 0] }
      it { is_expected.to eq [3, 12, 0, 0, 0] }
    end
  end
end
