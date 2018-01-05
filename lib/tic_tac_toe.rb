WIN_COMBINATIONS = [
 [0,1,2], # Top row
 [3,4,5],  # Middle row
 [6,7,8],  # Bottom row
 [0,3,6],  # First column
 [1,4,7],  # Middle column
 [2,5,8],  # Last column
 [0,4,8],  # Diagonal from top left to bottom right
 [6,4,2]  # Diagonal from bottom left to top right
]

def current_player(board)
  player = turn_count(board).even? ? "X" : "O"
end

def draw?(board)
  full?(board) && !won?(board)
end

def full?(board)
  return board.all? do |space|
    space != " " && space != nil
  end
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
end

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def turn_count(board)
  count = 0
  board.each do |space|
    if space != nil && space.strip != ""
      count += 1
    end
  end
  return count
end

def winner(board)
  winning_combo = won?(board)

  if winning_combo
    return board[winning_combo[0]]
  else
    return nil
  end
end

def won?(board)
  combination_moves = []
  won = false

  WIN_COMBINATIONS.each do |combination|

    combination_moves = [board[combination[0]],
                         board[combination[1]],
                         board[combination[2]]]

    won = (combination_moves.all? do |character|
        character == "X" end) ||
        (combination_moves.all? do |character|
        character == "O" end)

    if won
      return combination
    end
  end

  return false
end
