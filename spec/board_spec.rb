require_relative '../lib/board'

describe Board do
  
  describe '#col_full?' do
    subject(:col_full) {described_class.new}
    let(:grid) { col_full.instance_variable_get(:@grid) }

    context 'is not full' do
      it 'return false' do
        res = col_full.col_full?(0)
        expect(res).to be false
      end
    end

    context 'is full' do
      before do
        col = 0
        grid[0][col] = :x
      end
      it 'returns true' do
        col = 0
        res = col_full.col_full?(col)
        expect(res).to be true
      end
    end
  end

  describe '#horiz_win' do
    subject(:horiz_win) {described_class.new}
    let(:grid) { horiz_win.instance_variable_get(:@grid) }

    context 'horiz win is tru' do
      before do
        grid[0][0] = :X
        grid[0][1] = :X
        grid[0][2] = :X
        grid[0][3] = :X
      end
      it 'return true' do
        res = horiz_win.horiz_win(0,0,:X)
        expect(res).to be true
      end
    end

    context 'horiz win is false' do
      before do
        grid[0][0] = :X
        grid[0][1] = :X
        grid[0][2] = :O
        grid[0][3] = :X
      end
      it 'return false' do
        res = horiz_win.horiz_win(0,0,:X)
        expect(res).to be false
      end
    end

    context 'horiz > 3' do
      before do
        grid[0][3] = :X
        grid[0][4] = :X
        grid[0][5] = :X
        grid[0][6] = :X
      end
      it 'return nil' do
        res = horiz_win.horiz_win(0,4,:X)
        expect(res).to be nil
      end
    end

    describe '#vert_win' do
      subject(:vert_win) {described_class.new}
      let(:grid) { vert_win.instance_variable_get(:@grid) }
  
      context 'vert win is tru' do
        before do
          grid[5][0] = :X
          grid[4][0] = :X
          grid[3][0] = :X
          grid[2][0] = :X
        end
        it 'return true' do
          res = vert_win.vert_win(2,0,:X)
          expect(res).to be true
        end
      end
  
      context 'vert win is false' do
        before do
          grid[5][0] = :X
          grid[4][0] = :X
          grid[3][0] = :O
          grid[2][0] = :X
        end
        it 'return false' do
          res = vert_win.vert_win(2,0,:X)
          expect(res).to be false
        end
      end
  
      context 'vert > 2' do
        before do
          grid[2][0] = :X
          grid[3][0] = :X
          grid[4][0] = :X
          grid[5][0] = :X
        end
        it 'return nil' do
          res = vert_win.vert_win(3,0,:X)
          expect(res).to be nil
        end
      end
    end
  end
end