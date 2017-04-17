require 'spec_helper'

RSpec.describe Power do
  describe '#process' do
    let(:params) { [2, 2] }
    subject { Power.new.process(params[0], params[1]) }
    it { is_expected.to eq 4 }
    context 'when number is negative' do
      let(:params) { [-2, 2] }
      subject { Power.new.process(params[0], params[1]) }
      it { is_expected.to eq 4 }
    end
    context 'when number is 0' do
      let(:params) { [0, 2] }
      subject { Power.new.process(params[0], params[1]) }
      it { is_expected.to eq 0 }
    end
  end
end
