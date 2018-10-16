require_relative 'case_board_class'

class Board
  include Enumerable
  #TO DO : la classe a 1 attr_accessor, une array qui contient les BoardCases
  attr_accessor :board

  def initialize
    @board = [BoardCase.new(' '), BoardCase.new(' '), BoardCase.new(' '), BoardCase.new(' '), BoardCase.new(' '), BoardCase.new(' '), BoardCase.new(' '), BoardCase.new(' '), BoardCase.new(' ')] # le tableaud de jeu vide
  end

  def to_screen
    puts
    puts "  ▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀ "
    puts "  ▀▄ 1         ▀▄ 2         ▀▄ 3         ▀▄ "
    puts "  ▀▄     #{@board[0].value}     ▀▄     #{@board[1].value}     ▀▄     #{@board[2].value}     ▀▄ "
    puts "  ▀▄           ▀▄           ▀▄           ▀▄ "
    puts "  ▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀ "
    puts "  ▀▄ 4         ▀▄ 5         ▀▄ 6         ▀▄ "
    puts "  ▀▄     #{@board[3].value}     ▀▄     #{@board[4].value}     ▀▄     #{@board[5].value}     ▀▄ "
    puts "  ▀▄           ▀▄           ▀▄           ▀▄ "
    puts "  ▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀ "
    puts "  ▀▄ 7         ▀▄ 8         ▀▄ 9         ▀▄ "
    puts "  ▀▄     #{@board[6].value}     ▀▄     #{@board[7].value}     ▀▄     #{@board[8].value}     ▀▄ "
    puts "  ▀▄           ▀▄           ▀▄           ▀▄ "
    puts "  ▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀▄▀ "
    puts
  end

  def victory?
    case
    when @board[0].value == @board[1].value && @board[0].value == @board[2].value && @board[0].value != " " # la ligne du haut a les mêmes symboles et on exclue les espaces des conditions de victoires
      return true
    when @board[3].value == @board[4].value && @board[3].value == @board[5].value && @board[4].value != " " # ligne du milieu
      return true
    when @board[6].value == @board[7].value && @board[6].value == @board[8].value && @board[6].value != " " # ligne du bas
      return true
    when @board[0].value == @board[3].value && @board[0].value == @board[6].value && @board[0].value != " " # colonne de gauche
      return true
    when @board[1].value == @board[4].value && @board[1].value == @board[7].value && @board[4].value != " " # colonne du centre
      return true
    when @board[2].value == @board[5].value && @board[2].value == @board[8].value && @board[2].value != " " # colonne de droite
      return true
    when @board[0].value == @board[4].value && @board[0].value == @board[8].value && @board[0].value != " " # diagonale 1/5/9
      return true
    when @board[2].value == @board[4].value && @board[2].value == @board[6].value && @board[2].value != " " # diagonale 7/5/3
      return true
    else
      return false
    end
  end

  def play(array)
    #TO DO : une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
    if @board[array[2]].value == " " #vérifie que la case qui est jouée est vide (le array[2] va chercher la box_played dans le array player.state)
      if array[1] == "X" #Si le symbol du joueur est le X
        @board[array[2]].value = "X" # on met X
      else
        @board[array[2]].value = "O" #sinon on met les O
      end
    else
      puts
      puts "Failure! You can't play here: you lost your turn" # si la case n'est pas vide, le joeur perd son tour.
      puts
    end
  end

end
