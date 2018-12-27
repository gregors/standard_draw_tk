require 'spec_helper'

describe StdDraw do
  describe '.scale_x' do
    it 'scales to pixels' do
      StdDraw.pen_radius = 0.05
      expect(StdDraw.scale_x(0.5)).to eq 256.0
    end
  end

  describe '.scale_x' do
    it 'scales to pixels' do
      StdDraw.pen_radius = 0.05
      expect(StdDraw.scale_y(0.5)).to eq 256.0
    end
  end
end
