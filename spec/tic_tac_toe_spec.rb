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

  describe "#run" do
    before { allow(STDOUT).to receive(:puts) }

    context "when player one wins in three turns" do
      before do
        allow(STDIN).to receive(:gets).and_return("1","6","2","5","3")
      end

      it "prints game over after a player wins" do
        expect(STDOUT).to receive(:puts).with("Game Over: Thanks for Playing!")
        subject.run
      end
    end

    context "when neither player wins after nine turns" do
      before do
        allow(STDIN).to receive(:gets).
          exactly(9).times.
          and_return("1","2","3","5","4","7","6","9","8")
      end

      it "prints 'Tie Game' after catz game" do
        expect(STDOUT).to receive(:puts).with("Catz Game. No one wins. Thanks for Playing!")
        subject.run
      end
    end
  end

  describe "player_turn" do
    before do
      allow(STDIN).to receive(:gets).and_return("2")
      allow(STDOUT).to receive(:puts)
    end

    context "when player_one" do
      it "prompts a message asking for a move" do
        expect(STDOUT).to receive(:puts).
          with("Where would you like to move, #{player_one}? You are #{subject.player_one[:marker]} (choose 1-9):")

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
          with("Where would you like to move, #{player_two}? You are #{subject.player_two[:marker]} (choose 1-9):")

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
