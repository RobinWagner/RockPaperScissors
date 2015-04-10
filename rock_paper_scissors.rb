# Game play:
# 1. all players pick either Paper, Rock or Scissors
# 2. compare: paper > rock, rock > scissors, scissors > paper
#             or tie when players chose the same
# 3. play again?

CHOICES = { 'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors' }
puts 'Welcome to Paper, Rock, Scissors'

def display_winning_message(winning_choice)
  case winning_choice
  when 'p'
    'Paper wraps Rock!'
  when 'r'
    'Rock smashes Scissors!'
  when 's'
    'Scissors cuts Paper!'
  end
end

loop do
  player_choice = ''
  # player makes a pick
  loop do
    puts 'Pick one: (p, r, s):'
    player_choice = gets.chomp.downcase
    break if CHOICES.keys.include?(player_choice)
  end

  # computer makes a pick
  computer_choice = CHOICES.keys.sample

  if player_choice == computer_choice
    puts 'It\'s a tie!'
  elsif (player_choice == 'p' && computer_choice == 'r') ||
        (player_choice == 'r' && computer_choice == 's') ||
        (player_choice == 's' && computer_choice == 'p')
    puts display_winning_message(player_choice)
    puts 'You won!'
  else
    puts display_winning_message(computer_choice)
    puts 'Computer won!'
  end

  puts 'Do you want to continue? (y/n)'
  choice = gets.chomp.downcase
  break if choice != 'y'
end
