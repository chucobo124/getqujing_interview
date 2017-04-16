require 'spec_helper'

RSpec.describe GameOfLife do
  describe '#initialize' do
  end

  describe '#kill_cell' do
    let(:board) do
      [
        [0, 1, 1],
        [0, 1, 1],
        [0, 0, 1]
      ]
    end
    let(:expected) do
      [
        [0, 1, 1],
        [0, [1, 0], 1],
        [0, 0, 1]
      ]
    end
    subject { GameOfLife.new(board).kill_cell([2, 3]) }
    it { is_expected.to be false }
  end

  describe '#keep_cell_alive' do
  end

  describe '#grow_out_cells' do
  end

  describe '#check_cell' do
    let(:board) do
      [
        [0, 1, 1],
        [0, 1, 1],
        [0, 0, 1]
      ]
    end
    let(:selector) { [1, 1] }
    subject { GameOfLife.new(board).send(:check_cell, selector) }
    it { is_expected.to eq true: 4, false: 4 }
    context 'when select right buttom' do
      let(:selector) { [2, 2] }
      it { is_expected.to eq true: 2, false: 1 }
    end
  end

  describe '#gather_around_cell' do
    let(:board) do
      [
        [0, 1, 1],
        [0, 1, 1],
        [0, 0, 1]
      ]
    end
    let(:selector) { [1, 1] }
    subject { GameOfLife.new(board).send(:gather_around_cell, selector) }
    it { is_expected.to eq [0, 1, 1, 0, 0, 1, 0, 1] }
    context 'when select right top' do
      let(:selector) { [2, 0] }
      it { is_expected.to eq [1, 1, 1] }
    end
    context 'when select left middle' do
      let(:selector) { [2, 1] }
      it { is_expected.to eq [1, 1, 0, 1, 1] }
    end
    context 'when select right buttom' do
      let(:selector) { [2, 2] }
      it { is_expected.to eq [1, 1, 0] }
    end
    context 'when select left top' do
      let(:selector) { [0, 0] }
      it { is_expected.to eq [0, 1, 1] }
    end
    context 'when select left middle' do
      let(:selector) { [0, 1] }
      it { is_expected.to eq [0, 1, 0, 0, 1] }
    end
    context 'when select left buttom' do
      let(:selector) { [0, 2] }
      it { is_expected.to eq [0, 1, 0] }
    end
    context 'when select middle top' do
      let(:selector) { [1, 0] }
      it { is_expected.to eq [0, 1, 1, 0, 1] }
    end
    context 'when select middle down' do
      let(:selector) { [1, 2] }
      it { is_expected.to eq [0, 1, 1, 0, 1] }
    end
  end
end
