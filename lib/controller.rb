require 'gossip'
require 'view'

class Controller
  def initialize
    @view = View.new
  end

  def create_gossip
    params = @view.create_gossip
    gossip = Gossip.new(params[:author], params[:content])
    gossip.save
  end

  def index_gossips
    gossips = Gossip.all  #on demande au Model un array qui contient tous les potins que l'on a en base
    @view.index_gossips(gossips) #on demande à la View d'exécuter sa propre méthode index_gossips qui affichera tous les potins
  end

  def delete_gossip
    index = @view.delete_gossip
    Gossip.delete_gossip(index)
  end
end