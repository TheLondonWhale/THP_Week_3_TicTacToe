class BoardCase
  #TO DO : la classe a 2 attr_accessor, sa valeur (X, O, ou vide), ainsi que son numéro de case)

attr_accessor :value, :position


  def initialize
    #TO DO doit régler sa valeur, ainsi que son numéro de case
  end

  def to_s
    #TO DO : doit renvoyer la valeur au format string
  end

end

class Board
  include Enumerable
  #TO DO : la classe a 1 attr_accessor, une array qui contient les BoardCases

   attr_accessor :board


  def initialize
    @board = [ " ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def play
    #TO DO : une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
  end

  def victory?
    case
    when @board[0] == @board[1] == @board[2] && @board[0] != " "
      return true
    case
    when @board[3] == @board[4] == @board[5] && @board[4] != " "
      return true
    case
    when @board[6] == @board[7] == @board[8] && @board[6] != " "
      return true
    case
    when @board[0] == @board[3] == @board[6] && @board[0] != " "
      return true
    case
    when @board[1] == @board[4] == @board[7] && @board[4] != " "
      return true
    case
    when @board[2] == @board[5] == @board[8] && @board[2] != " "
      return true
    case
    when @board[0] == @board[4] == @board[8] && @board[0] != " "
      return true
    case
    when @board[2] == @board[4] == @board[6] && @board[2] != " "
      return true
    else
      return false
    end
  end

end

class Player
  #TO DO : la classe a 2 attr_accessor, son nom, sa valeur (X ou O). Elle a un attr_writer : il a gagné ?

attr_accessor :name :value


  def initialize
    @name = name
    @value =
  end

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
    @name_player_1 = gets.chomp.to_s
    puts
    puts "How's taking the O ?"
    puts ">"
    @name_player_2 = gets.chomp.to_s
    puts
    sleep (2)
    @player_1 = Player.new
    @player_2 = Player.new
    @players = [@player_1, @player_2]
    @board = Board.new

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

  def turn
#TO DO : affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie

seulement 9 tours => compteur de tours


turn = 0

until board.victory? = true

  end

end

Game.new.go
