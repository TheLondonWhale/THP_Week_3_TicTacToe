
class Game


  def initialize
    puts "♪♬ ♩ ♭♪ ♪♭♩ ♬ ♪ ♪♬ ♩ ♭♪ ♪♭♩ ♬ ♪"
    sleep (2)
    puts
    puts "Let's play ..."
    sleep (2)
    puts
    puts "█████▓▓▓▒▒▒░░░ TIC TAC TOE ░░░▒▒▒▓█████"
    sleep (2)
    puts
    puts "How's taking the X ?"
    puts ">"
    name_player_1 = gets.chomp.to_s
    puts
    puts "How's taking the O ?"
    puts ">"
    name_player_2 = gets.chomp.to_s
    puts
    sleep (2)
  end

  def go
    # TO DO : lance la partie

 puts "▁ ▂ ▃ ▄ ▅ ▆ ▇  R U L E S █ ▇ ▆ ▅ ▄ ▂ ▁"
 sleep (2)
 puts
 puts "Players take turns to make their moves, one player at a time."
 sleep (2)
 puts
 puts "The goal is to align 3 'X' or 'O'."
 sleep (2)
 puts
 puts "boxes are numbered from 1 to 9"
 puts "puts the number of the case you wanna play."
 sleep (2)
 puts
 puts "The goal is to align 3 'X' or 'O' in the boxes."
 sleep (2)
 puts
 puts "May the odds be always in your favor / So it begins..."
 puts
 puts
 to_screen
  end

  def to_screen

    puts "  ▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀ "
    puts "  ▀▄ 1         ▀▄ 2         ▀▄ 3         ▀▄ "
    puts "  ▀▄     #{@board[0]}     ▀▄     #{@board[1]}     ▀▄     #{@board[2]}     ▀▄ "
    puts "  ▀▄           ▀▄           ▀▄           ▀▄ "
    puts "  ▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀ "
    puts "  ▀▄ 4         ▀▄ 5         ▀▄ 6         ▀▄ "
    puts "  ▀▄     #{@board[3]}     ▀▄     #{@board[4]}     ▀▄     #{@board[5]}     ▀▄ "
    puts "  ▀▄           ▀▄           ▀▄           ▀▄ "
    puts "  ▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀ "
    puts "  ▀▄ 7         ▀▄ 8         ▀▄ 9         ▀▄ "
    puts "  ▀▄     #{@board[6]}     ▀▄     #{@board[7]}     ▀▄     #{@board[8]}     ▀▄ "
    puts "  ▀▄           ▀▄           ▀▄           ▀▄ "
    puts "  ▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀ "
  end

end

  Game.new.go
