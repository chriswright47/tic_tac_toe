require_relative "../spec_helper.rb"
require_relative "../tic_tac_toe.rb"

RSpec.describe TicTacToe do
  subject { described_class.new(player_one: player_one, player_two: player_two) }
  let(:player_one) { "foo" }
  let(:player_two) { "bar" }

  it "works" do
    expect(subject).to be_a TicTacToe
  end

  describe "#update_board" do
    # TODO:...
  end

  describe "player_turn" do
    before do
      allow(STDIN).to receive(:gets).and_return("2")
      allow(STDOUT).to receive(:puts)
    end

    context "when player_one" do
      it "prompts a message asking for a move" do
        expect(STDOUT).to receive(:puts).
          with("Where would you like to move, #{subject.player_one[:name]}? You are #{subject.player_one[:marker]} (choose 1-9):")

        subject.player_turn(player: subject.player_one)
      end

      it "calls update_board with correct arguments" do
        expect(subject).to receive(:update_board).
          with(board_index: 1, marker: subject.player_one[:marker])

        subject.player_turn(player: subject.player_one)
      end
    end

    context "when player_two" do
      it "prompts a message asking for a move" do
        expect(STDOUT).to receive(:puts).
          with("Where would you like to move, #{subject.player_two[:name]}? You are #{subject.player_two[:marker]} (choose 1-9):")

        subject.player_turn(player: subject.player_two)
      end

      it "calls update_board with correct arguments" do
        expect(subject).to receive(:update_board).
          with(board_index: 1, marker: subject.player_two[:marker])

        subject.player_turn(player: subject.player_two)
      end
    end
  end
end
