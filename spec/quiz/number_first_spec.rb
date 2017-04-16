require 'spec_helper'

RSpec.describe NumberFirst do
  describe '#self.sorting' do
    let(:array_params) { [0, 1, 0, 3, 12] }
    subject { NumberFirst.sorting(array_params)}
    it { is_expected.to eq [1, 3, 12, 0, 0] }
  end
end
