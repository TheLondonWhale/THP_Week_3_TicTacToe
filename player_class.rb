class Player
  #TO DO : la classe a 2 attr_accessor, son nom, sa valeur (X ou O). Elle a un attr_writer : il a gagné ?
attr_accessor :name, :symbol

  def initialize(name, symbol_player)
    @name = name
    @symbol = symbol_player
  end

end
