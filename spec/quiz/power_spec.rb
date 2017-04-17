require 'spec_helper'

RSpec.describe Power do
  describe '#process' do
    let(:params) { [2, 2] }
    subject { Power.new.process(params[0], params[1]) }
    it { is_expected.to eq 4 }
  end
end
