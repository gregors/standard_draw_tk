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
  end
end
