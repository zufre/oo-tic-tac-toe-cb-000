class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end


  WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(input)
    index = input.to_i - 1
  end
  def move(index, token = "X")
    @board[index] = token
  end
  def position_taken?(index)
    @board[index] != " "
  end
  def valid_move?(index)
    index.between?(0,9) && !position_taken?(index)
  end
  def turn_count
    @board.count do |item|
      item != " "
    end
  end
  def current_player
    turn_count.even? ? "X" : "O"
  end
  def turn
    puts "Please enter a number between 1-9"
    input = gets.strip
    index = input_to_index(input)
    valid_move?(index) ? move(index, current_player)  : turn
    display_board
  end
  def won?
    WIN_COMBINATIONS.any? do |arr|
      if @board[arr[0]] == @board[arr[1]] && @board[arr[1]] == @board[arr[2]] && position_taken?(arr[0])
        return arr
      end
    end
  end
  def full?
    @board.all? do |item|
      item != " "
    end
  end
  def draw?
     full? && !won?
  end
  def over?
    draw? || won?
  end
  def winner
    won? ? @board[won?[0]] : nil
  end
  def play
    until over?
      turn
    end
    puts winner ?  "Congratulations #{winner}!" : "Cats Game!"

  end
end
