require 'spec_helper'

RSpec.describe SimpleRootSquare do
  describe '#process' do
    let(:number_params) { 144 }
    subject { SimpleRootSquare.new.process(number_params) }
    it { is_expected.to eq 12 }
    context 'when number is negative' do
      let(:number_params) { -144 }
      it { is_expected.to eq 0 }
    end
    context 'when number is 0' do
      let(:number_params) { 0 }
      it { is_expected.to eq 0 }
    end
    context 'when number is 1' do
      let(:number_params) { 1 }
      it { is_expected.to eq 1 }
    end
    context 'when number is 5.67' do
      let(:number_params) { 5.67 }
      it { is_expected.to eq 2 }
    end
  end
end
