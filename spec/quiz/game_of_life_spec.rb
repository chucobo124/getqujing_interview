require 'spec_helper'

RSpec.describe GameOfLife do
  describe '#execute' do
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
        [0, 0, 0],
        [0, 1, 1]
      ]
    end
    subject { GameOfLife.new(board).execute }
    it { is_expected.to eq expected }
    context 'when wronge case 1' do
      let(:board) do
        [
          [0, 1, 0],
          [1, 0, 1],
          [1, 0, 1]
        ]
      end
      let(:expected) do
        [
          [0, 1, 0],
          [1, 0, 1],
          [0, 0, 0]
        ]
      end
      it { is_expected.to eq expected }
    end
    context 'when wronge case 2 and run 2 times' do
      subject do
        main_proccess = GameOfLife.new(board)
        Array.new(2) do
          main_proccess.execute
        end.last
      end
      let(:board) do
        [
          [0, 0, 0, 0],
          [0, 1, 1, 0],
          [0, 1, 1, 0],
          [0, 0, 0, 0]
        ]
      end
      it { is_expected.to eq board }
    end
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
    let(:selector) { [1, 1] }
    subject { GameOfLife.new(board).kill_cell(selector) }
    it { is_expected.to eq expected }
    context 'when select the alive cell' do
      let(:selector) { [2, 0] }
      it { is_expected.to eq board }
    end
    context 'when board of some number had been flag' do
      before do
        subject.instance_variable_set(:@padding_board,
                                      [
                                        [0, 1, 1],
                                        [0, [1, 0], 1],
                                        [1, 0, 1]
                                      ])
      end
      subject { GameOfLife.new(board) }
      let(:board) do
        [
          [0, 1, 1],
          [0, 1, 1],
          [1, 0, 1]
        ]
      end
      let(:expected) do
        [
          [0, 1, 1],
          [0, [1, 0], 1],
          [[1, 0], 0, 1]
        ]
      end
      let(:selector) { [0, 2] }
      it 'mached the expected' do
        expect(subject.kill_cell(selector)).to eq expected
      end
    end
  end

  describe '#keep_cell_alive' do
    let(:board) do
      [
        [0, 1, 0],
        [1, 1, 1],
        [1, 0, 1]
      ]
    end
    let(:expected) do
      [
        [0, [1, 1], 0],
        [1, 1, 1],
        [1, 0, 1]
      ]
    end
    let(:selector) { [1, 0] }
    subject { GameOfLife.new(board).send(:keep_cell_alive, selector) }
    it { is_expected.to eq expected }
    context 'when cell is obey to raising role' do
      let(:expected) do
        [
          [0, 1, [0, 1]],
          [1, 1, 1],
          [1, 0, 1]
        ]
      end
      let(:selector) { [2, 0] }
      it { is_expected.to eq expected }
    end
    context 'when cell is obey to raising role and position is on middle buttom' do
      let(:board) do
        [
          [0, 1, 0],
          [0, 1, 1],
          [0, 0, 1]
        ]
      end
      let(:expected) do
        [
          [0, 1, 0],
          [0, 1, 1],
          [0, [0, 1], 1]
        ]
      end
      let(:selector) { [1, 2] }
      it { is_expected.to eq expected }
    end
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
