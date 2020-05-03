# frozen_string_literal: true

require_relative '../stock'

RSpec.describe Stock do

  describe '#execute' do
    subject { Stock.new(prices: prices).execute }

    context 'when max value is after min' do
      let(:prices) { [10, 7, 5, 8, 11, 9] }

      it 'returns 6' do
        expect(subject).to eq(6)
      end
    end

    context 'when max value is before min' do
      let(:prices) { [11, 6, 2, 5, 3, 10, 1, 4] }

      it 'returns 8' do
        expect(subject).to eq(8)
      end
    end

    context 'when max value is before min' do
      let(:prices) { [11, 6, 10, 5, 3, 10, 1, 4] }

      it 'returns 7' do
        expect(subject).to eq(7)
      end
    end

    context 'when desire max value is second max' do
      let(:prices) { [9, 10, 1, 7] }

      it 'returns 6' do
        expect(subject).to eq(6)
      end
    end

    context 'when all prices are going down' do
      let(:prices) { [10, 9, 8, 7] }

      it 'returns negative 1' do
        expect(subject).to eq(-1)
      end
    end
  end
end
