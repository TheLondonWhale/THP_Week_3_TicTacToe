require_relative 'player_class'
require_relative 'board_class'

class Game

  def initialize
    puts "♪♬ ♩ ♭♪ ♪♭♩ ♬ ♪ ♪♬ ♩ ♭♪ ♪♭♩ ♬ ♪"
    sleep 1 #permet de décaler l'apparition des autres étapes
    puts
    puts "Let's play ..."
    sleep 1.5
    puts
    puts "█████▓▓▓▒▒▒░░░ TIC TAC TOE ░░░▒▒▒▓█████"
    sleep 1
    puts
    print "How's taking the X ? > "
    name_player_1 = gets.chomp.to_s #On a le nom du joueur 1
    symbol_player_1 = "X" # On lui assigne les X
    puts
    print"How's taking the O ? > "
    name_player_2 = gets.chomp.to_s #On a le nom du joueur 1
    symbol_player_2 = "O" # On lui assigne les X
    puts
    sleep 1.5
    puts "▁ ▂ ▃ ▄ ▅ ▆ ▇  R U L E S █ ▇ ▆ ▅ ▄ ▂ ▁" #On explique les règles
    sleep 1.5
    puts
    puts "Players take turns to make their moves, one player at a time."
    sleep 1.5
    puts
    puts "The goal is to align 3 'X' or 'O'." #Les conditions de victoires
    sleep 1.5
    puts
    puts " IF YOU TRY TO PLAY ON A TAKEN BOXES, YOU LOSE YOUR TURN "
    puts "boxes are numbered from 1 to 9:" #permet de se repérer dans l'array des board_cases
    puts "puts the number of the case you wanna play."
    sleep 1.5
    puts
    @player_1 = Player.new(name_player_1, symbol_player_1) #on crée les instances de la méthodes Player avce les infos reçues
    @player_2 = Player.new(name_player_2, symbol_player_2)
    @players = [@player_1, @player_2] #on crée un array avec les 2 joueurs pour faire une métode .each dans la méthode turn après
    @new_board = Board.new # on créé un nouveau tableau de jeu
  end

  def go
  # TO DO : lance la partie

   puts "May the odds be always in your favor / So it begins..."
   puts
   sleep 1.5
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
          puts
          puts
          sleep 2
          print "Wanna play again ? enter Yes or No >"
          answer = gets.chomp #petit downcase pour éviter les erreurs à cause de Y ou y.
          if answer.downcase.include? "y"
            Game.new.go #on relance le jeu si oui!
          else
            puts
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
          puts
          sleep 2
          print "Wanna play again ? enter Yes or No >" #proposition de nouveau jeu
          answer = gets.chomp
          if answer.downcase.include? "y"
            Game.new.go #Si oui, on relance.
          else
            puts
            puts "You sucked anyway..."
            puts
            break
          end
          break
        end # end if
      end #end du each
    end # end du *gros* until
  end # end de la methode turn

end # end de la classe

Game.new.go
