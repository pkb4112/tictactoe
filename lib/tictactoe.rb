#TicTacToe 09/09/17 - The Odin Project 

#This is the class for methods/variables regarding player info and actions
class Player

  attr_accessor :name

  def get_name
  	if block_given?
  	  yield          # Allows specification of Player 1 or 2
  	else 
      "Enter Player Name"
    end
    self.name = gets.chomp.to_s
  end

end #Player class end

#This is the class for constructing and modifying the gameboard
class GameBoard

  attr_accessor :x,:y,:board

#Initializes a new GameBoard
  def initialize(x=3,y=3)
    @x=x
    @y=y                
	draw_new
  end

# Displays the board to the screen
  def show_board
  	@y.times do |y|
  		puts ' '
  		@x.times do |x|
  			print "#{@board[y][x]} "
  		end
  	end 
  	puts ' '
  end

#Checks for winning conditions
  def win?
    win=[false,false]   #[player1,player2]
      @y.times do |y|
        	#Winning Conditions
        if @board[y][0...@x].all? {|x| x=="X"} # Rows
    	  win=[true,false]
    	elsif @board[y][0...@x].all? {|x| x=="O"}
    	  win=[false,true]
    	elsif                                  #Diagonals (Currently limited to 3x3)
    	  if @board[0][0] == "X" && @board[1][1] == "X" && @board[2][2] == "X" 
    	    win=[true,false]
    	  elsif @board[0][2] == "X" && @board[1][1] == "X" && @board[2][0] == "X"
    	    win=[true,false]
    	  elsif @board[0][0] == "O" && @board[1][1] == "O" && @board[2][2] == "O"
    	    win=[false,true]
    	  elsif @board[0][2] == "O" && @board[1][1] == "O" && @board[2][0] == "O"
    	    win=[false,true]
    	  end
    	end
      end
    	

      @x.times do |x|
        if @board[0][x] == "X" && @board[1][x] == "X" && @board[2][x] == "X"  #Columns
    	  win=[true,false]
    	elsif @board[0][x] == "O" && @board[1][x] == "O" && @board[2][x] == "O" 
    	 win=[false,true]
    	end
      end
    	     	
      
    
    return win
  end  


protected

# Creates a fresh board
  def draw_new
	   @board=Array.new(@y) {Array.new(@x){'*'}}
	   
  end


end #GameBoard class end


#This is the class for the gameplaying processes

class TicTacToe
	
#Initializes the TicTacToe game
  def initialize()
    @tic=GameBoard.new
    @player1=Player.new
    @player1.get_name{puts "Enter Player 1 Name:"}
    @player2=Player.new
    @player2.get_name{puts "Enter Player 2 Name:"}
	@turn_count = 0
	play
  end

#The loop for playing the game
  def play
    until @tic.win?[0] || @tic.win?[1] || @turn_count == @tic.x*@tic.y
      @tic.show_board
      puts ' '
      location_selected = get_player_input
      if check_space?(location_selected)
        place_piece(location_selected)
      else 
    	puts "That location has already been played, or is outside of the game board. Please choose another location."
      end
    end

    @tic.show_board
    puts ' '

    if @tic.win?[0]
      puts "#{@player1.name} Wins!"
    elsif @tic.win?[1]
      puts "#{@player2.name} Wins!"
    else
      puts "Tie - Game Over"
    end
  end

#Checks to see if the space on the board the player has selected is valid
  def check_space?(input_loc)
    valid=false
    begin
      x_val = input_loc[0]
      y_val = input_loc[1]
      if @tic.board[x_val][y_val] == "*"
        valid=true
      end
    rescue
    end
      
    return valid
  end
   
 

  protected

  private 

  def get_player_input  
    if @turn_count%2 == 0 
      player = @player1
      player_id=1
    else 
      player = @player2
      player_id=2
    end
    
    puts "#{player.name}: Enter Grid Location in Form 'X,Y'"
    begin
      player_input = gets.chomp
      if /\d+/.match(player_input)
        x_val = /\A(\d)/.match(player_input)[0].to_i
        y_val = /(\d)\z/.match(player_input)[0].to_i
        return [x_val,y_val,player_id]

      else
    	puts "Invalid Input"
      end
    rescue
    	puts "Invalid Input"
    end

  
  end

  def place_piece(grid_loc)
    	x_val = grid_loc[0]
    	y_val = grid_loc[1]
    	case grid_loc[2]
    	when 1
    		@tic.board[x_val][y_val] = "X"
    		@turn_count+=1
    	when 2
    		@tic.board[x_val][y_val] = "O"
    		@turn_count+=1
    	end
  end



end #TicTacToe class end

#game1=TicTacToe.new