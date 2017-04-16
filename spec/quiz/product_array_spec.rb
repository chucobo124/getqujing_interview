require 'test_helper'
describe ProductArray do
  describe 'output' do
    let(:array_params) { [1, 2, 3, 4] }
    subject { ProductArray.output(array_params) }
    it { is_expected.to eq [24, 12, 8, 6] }
    context 'when array have duplicate number' do
      let(:array_params) { [1, 1, 3, 3, 4, 4] }
      it { is_expected.to eq [144, 144, 48, 48, 36, 36] }
    end
    context 'when array\'s is irregular' do
      let(:array_params) { [] }
      it { is_expected.to eq [] }
    end
    context 'when array has zero number' do
      let(:array_params) { [1, 0, 4, 6] }
      it { is_expected.to eq [0, 24, 0, 0] }
    end
    context 'when array has negative number' do
      let(:array_params) { [-1, 2, 4, 6] }
      it { is_expected.to eq [48, -24, -12, -8] }
    end
  end
end
