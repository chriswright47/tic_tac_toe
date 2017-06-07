require_relative "../spec_helper.rb"
require_relative "../board.rb"

RSpec.describe Board do
  subject { described_class.new }

  describe "#empty_square_indexes" do
    # [
    #   ["-","-","-"],
    #   ["-","-","-"],
    #   ["-","-","-"]
    # ] => [1,2,3,4,5,6,7,8,9]

    it "returns 1-9" do
      expect(subject.empty_square_indexes).to eq [1,2,3,4,5,6,7,8,9]
    end

    context "some spaces taken" do
      subject { described_class.new(squares: squares) }

      let(:squares) { [
        ["-","-","-"],
        ["-","X","-"],
        ["-","-","0"]
      ] }

      it "returns 1-9 minus the full squares" do
        expect(subject.empty_square_indexes).to eq [1,2,3,4,6,7,8]
      end
    end


    # [
    #   ["-","-","-"],
    #   ["-","X","-"],
    #   ["-","-","0"]
    # ] => [1,2,3,4,6,7,8]
  end

end
