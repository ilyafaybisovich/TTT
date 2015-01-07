def initialize_board
  board = {}
  (1..9).each{|position| board[position] = ' '}
  board
end

def check_winner(b)
  winning_threes = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_threes.each do |three|
    return "Player" if b.values_at(*three).count('X') == 3
    return "Computer" if b.values_at(*three).count('O') == 3
  end
  nil
end

def announce_winner(winner)
  puts "#{winner} won!"
end

def empty_positions(b)
  b.select {|key,value| value == ' '}
end

def player_moves(b)
  begin
    puts "Choose an available position"
    position = gets.chomp.to_i
  end until empty_positions(b).include?(position)
  b[position] = 'X'
end

def computer_moves(b)
  position = empty_positions(b).keys.sample
  b[position] = 'O'
end

def draw_board(b)
  system 'clear'
  puts "       |       |       "
  puts "   #{b[1]}   |   #{b[2]}   |   #{b[3]}   "
  puts "       |       |       "
  puts "-------+-------+------"
  puts "       |       |       "
  puts "   #{b[4]}   |   #{b[5]}   |   #{b[6]}   "
  puts "       |       |       "
  puts "-------+-------+------"
  puts "       |       |       "
  puts "   #{b[7]}   |   #{b[8]}   |   #{b[9]}   "
  puts "       |       |       "
end

board = initialize_board
draw_board(board)
begin 
  
  player_moves(board)
  computer_moves(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_positions(board).empty?
if winner
  announce_winner(winner)
else
  puts "It's a tie!"
end


