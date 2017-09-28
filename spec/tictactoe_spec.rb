require "tictactoe"

describe "GameBoard" do

let(:test_board) {GameBoard.new}
   
  describe ".win?" do
 
    context "Checks for winning conditions based on three different gameboard configurations" do
      
     
      it "Returns player 1 win when a row is full of X" do
        test_board.instance_variable_set(:@board,[['X','X','X'],['*','*','*'],['*','*','*']])
        expect(test_board.win?).to eql([true,false])
      end

      it "Returns player 1 win when a column is full of X" do
        test_board.instance_variable_set(:@board,[['X','*','*'],['X','*','*'],['X','*','*']])
        expect(test_board.win?).to eql([true,false])
      end

     
      it "Returns player 1 win when a diagonal is full of X" do 
        test_board.instance_variable_set(:@board,[['X','*','*'],['*','X','*'],['*','*','X']])
        expect(test_board.win?).to eql([true,false])
      end

      it "Returns player 2 win when a row is full of O" do
        test_board.instance_variable_set(:@board,[['O','O','O'],['*','*','*'],['*','*','*']])
        expect(test_board.win?).to eql([false,true])
      end

      it "Returns player 2 win when a column is full of O" do
        test_board.instance_variable_set(:@board,[['O','*','*'],['O','*','*'],['O','*','*']])
        expect(test_board.win?).to eql([false,true])
      end

     
      it "Returns player 2 win when a diagonal is full of O" do 
        test_board.instance_variable_set(:@board,[['O','*','*'],['*','O','*'],['*','*','O']])
        expect(test_board.win?).to eql([false,true])
      end

    end 
  end   #.win?

end #GameBoard

describe "TicTacToe" do
  describe ".check_space?" do
    let(:tictactoe) {TicTacToe.new}
    context "Given in bounds location" do

      it "returns true" do
        expect(tictactoe.check_space?([2,2])).to eql(true)
      end
      
    end
  end
end
