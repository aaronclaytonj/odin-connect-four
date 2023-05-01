require_relative '../lib/game'

describe Game do
  describe '#swap_player' do
    subject(:player_turn) {described_class.new}
    let(:player1) { player_turn.instance_variable_get(:@player1) }
    let(:player2) { player_turn.instance_variable_get(:@player2) }
    
    context 'player 2s turn' do
      it 'return player 2' do
        player = player_turn.swap_player
        expect(player).to equal(player2)
      end
    end
    context 'player 1s turn' do
      before do
        player_turn.instance_variable_set(:@curr_player, player2)
      end

      it 'returns player 1' do
        player = player_turn.swap_player
        expect(player).to equal(player1)
      end
    end
  end
end