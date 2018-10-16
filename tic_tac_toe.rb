

class Game

  def initialize
    puts "♪♬ ♩ ♭♪ ♪♭♩ ♬ ♪ ♪♬ ♩ ♭♪ ♪♭♩ ♬ ♪"
    sleep (0.1) #permet de décaler l'apparition des autres étapes
    puts
    puts "Let's play ..."
    sleep (0.1)
    puts
    puts "█████▓▓▓▒▒▒░░░ TIC TAC TOE ░░░▒▒▒▓█████"
    sleep (0.1)
    puts
    print "How's taking the X ? > "
    name_player_1 = gets.chomp.to_s #On a le nom du joueur 1
    symbol_player_1 = "X" # On lui assigne les X
    puts
    print"How's taking the O ? > "
    name_player_2 = gets.chomp.to_s #On a le nom du joueur 1
    symbol_player_2 = "O" # On lui assigne les X
    puts
    sleep (0.1)
    @player_1 = Player.new(name_player_1, symbol_player_1) #on crée les instances de la méthodes Player avce les infos reçues
    @player_2 = Player.new(name_player_2, symbol_player_2)
    @players = [@player_1, @player_2] #on crée un array avec les 2 joueurs pour faire une métode .each dans la méthode turn après
    @new_board = Board.new # on créé un nouveau tableau de jeu
  end

  def go
  # TO DO : lance la partie

   puts "▁ ▂ ▃ ▄ ▅ ▆ ▇  R U L E S █ ▇ ▆ ▅ ▄ ▂ ▁" #On explique les règles
   sleep 1
   puts
   puts "Players take turns to make their moves, one player at a time."
   sleep 1
   puts
   puts "The goal is to align 3 'X' or 'O'." #Les conditions de victoires
   sleep 1
   puts
   puts " IF YOU TRY TO PLAY ON A TAKEN BOXES, YOU LOSE YOUR TURN "
   puts "boxes are numbered from 1 to 9:" #permet de se repérer dans l'array des board_cases
   puts "puts the number of the case you wanna play."
   sleep 1
   puts
   puts "May the odds be always in your favor / So it begins..."
   puts
   sleep 1
   self.turn #on lance le jeu ici. La method turn s'appelle elle même
  end

  def turn
  #TO DO : affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie

    turns = 0 # on génère un compteur pour avoir les tours de jeux et surtout parce que si turns > 8 = match nul !
    until @new_board.victory? do # tant qu'une condition de victoire n'est pas remplie, on continue de jouer.
      @players.each  do |player| #le fameux .each pour faire jouer chaque joueur
        @new_board.to_screen # on affiche le tableau
        puts
        puts "█████▓▓▓▒▒▒░░░ TURN #{turns + 1} ░░░▒▒▒▓█████" # on met plus un comme turns démarre à zéro
        puts
        puts " It's your turn #{player.name}. Where do you want to play?"
        print " Give a number between 1 and 9 :" #on insiste sur le bon chifre à mettre (test 1: par la confiance en l'intelligence des joueurs)
        box_played = gets.chomp.to_i # On récupère la valeur

        until box_played > 0 && box_played < 10 # On insiste sur le bon chiffre à mettre (test 2: l'impartialité sans faille du code vs la patience d'un imbécile)
          print "Wrong number, please enter a valid number (between 1 and 9 included) :" #Rapple à la loi
          box_played = gets.chomp.to_i
        end

        box_played = box_played - 1 #On enlève 1 pour faire correspondre le choix du joueur à la position de la case dans l'array
        @player_state = [player.name, player.symbol, box_played] #on crée un array que l'on va utiliser avec la méthode play de la class Board
        @new_board.play(@player_state) #on utilise donc la méthode play grâce à notre array et on l'applique à notre tableau de jeu

        if @new_board.victory? #pas besoin de mettre = true pour un if (en tout cas ça marche sans)
          @new_board.to_screen
          puts
          puts
          puts "¸.·'★¸.·'★*·~-.¸-(★ CONGRATS #{player.name}★)-,.-~*¸.·'★¸.·'★"
          puts "      ¸.·'★¸.·'★*·~-.¸-(★ YOU WON !!!★)-,.-~*¸.·'★¸.·'★      "
          sleep 2
          print "Wanna play again ? enter Yes or No >"
          answer = gets.chomp #petit downcase pour éviter les erreurs à cause de Y ou y.
          if answer.downcase.include? "y"
            Game.new.go #on relance le jeu si oui!
          else
            puts "You sucked anyway..."
          end
          break # permet de casser la boucle si un joueur a gagné.
        end

        turns += 1 #on passe au tour suivant

        if turns > 8
          @new_board.to_screen
          puts
          puts
          puts "    ¸.·'★¸.·'★*·~-.¸-(★ CONGRATS SUCKERS ★)-,.-~*¸.·'★¸.·'★    "
          puts " ¸.·'★¸.·'★*·~-.¸-(★ YOU FOOLED YOURSELVES ★)-,.-~*¸.·'★¸.·'★  "
          puts "   凸(^_^)凸   凸(^_^)凸   IT'S A DRAW    凸(^_^)凸   凸(^_^)凸 "
          puts
          sleep 2
          print "Wanna play again ? enter Yes or No >" #proposition de nouveau jeu
          answer = gets.chomp
          if answer.downcase.include? "y"
            Game.new.go #Si oui, on relance.
          else
            puts "You sucked anyway..."
            break
          end
          break
        end # end if
      end #end du each
    end # end du *gros* until
  end # end de la methode turn

end # end de la classe

############################################################################################

class Player
  #TO DO : la classe a 2 attr_accessor, son nom, sa valeur (X ou O). Elle a un attr_writer : il a gagné ?
attr_accessor :name, :symbol

  def initialize(name, symbol_player)
    @name = name
    @symbol = symbol_player
  end

end

############################################################################################

class Board
  include Enumerable
  #TO DO : la classe a 1 attr_accessor, une array qui contient les BoardCases
  attr_accessor :board

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "] # le tableaud de jeu vide
  end

  def to_screen
    puts
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
    puts
  end

  def victory?
    case
    when @board[0] == @board[1] && @board[0] == @board[2] && @board[0] != " " # la ligne du haut a les mêmes symboles et on exclue les espaces des conditions de victoires
      return true
    when @board[3] == @board[4] && @board[3] == @board[5] && @board[4] != " " # ligne du milieu
      return true
    when @board[6] == @board[7] && @board[6] == @board[8] && @board[6] != " " # ligne du bas
      return true
    when @board[0] == @board[3] && @board[0] == @board[6] && @board[0] != " " # colonne de gauche
      return true
    when @board[1] == @board[4] && @board[1] == @board[7] && @board[4] != " " # colonne du centre
      return true
    when @board[2] == @board[5] && @board[2] == @board[8] && @board[2] != " " # colonne de droite
      return true
    when @board[0] == @board[4] && @board[0] == @board[8] && @board[0] != " " # diagonale 1/5/9
      return true
    when @board[2] == @board[4] && @board[2] == @board[6] && @board[2] != " " # diagonale 7/5/3
      return true
    else
      return false
    end
  end

  def play(array)
    #TO DO : une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
    if @board[array[2]] == " " #vérifie que la case qui est jouée est vide (le array[2] va chercher la box_played dans le array player.state)
      if array[1] == "X" #Si le symbol du joueur est le X
        @board[array[2]] = "X" # on met X
      else
        @board[array[2]] = "O" #sinon on met les O
      end
    else
      puts
      puts "Failure! You can't play here: you lost your turn" # si la case n'est pas vide, le joeur perd son tour.
      puts
    end
  end

end

########################################

Game.new.go
