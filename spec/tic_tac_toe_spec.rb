require_relative "../spec_helper.rb"
require_relative "../tic_tac_toe.rb"

RSpec.describe TicTacToe do
  subject { described_class.new }
  it "works" do
    expect(subject).to be_a TicTacToe
  end
end
