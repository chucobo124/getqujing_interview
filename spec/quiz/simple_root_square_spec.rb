require 'spec_helper'

RSpec.describe SimpleRootSquare do
  describe '#process' do
    let(:number_params) { 144 }
    subject { SimpleRootSquare.new.process(number_params) }
    it { is_expected.to eq 12 }
  end
end
