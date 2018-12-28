require 'spec_helper'

module StandardDrawTk
  describe Coordinates do
    describe '.scale_x' do
      it 'scales to pixels' do
        expect(subject.scale_x(0.5)).to eq 256.0
      end
    end

    describe '.scale_x' do
      it 'scales to pixels' do
        expect(subject.scale_y(0.5)).to eq 256.0
      end
    end

    describe '.factor_x' do
      it 'scales to pixels' do
        expect(subject.factor_x(0.02)).to eq 10.24
      end
    end

    describe '.factor_y' do
      it 'scales to pixels' do
        expect(subject.factor_y(0.222)).to eq 113.664
      end
    end

  end
end
