require 'controller'

class Router
  def initialize
    @controller = Controller.new
  end

  def perform
    puts "Bienvenue dans The Gossip Project"

    while true
      
      puts "Quelle action veux-tu faire ?"
      puts "1. Créer un potin"
      puts "2. Afficher tous les potins"
      puts "3. Quel potin veux-tu supprimer ?"
      puts "4. Quitter l'app"
      params = gets.chomp.to_i

      case params
      when 1
        puts "Tu as choisi de créer un potin"
        @controller.create_gossip
        puts
        puts

      when 2
        puts "Tu as choisis d'afficher tous les potins"
        @controller.index_gossips
        puts
        puts

      when 3
        puts "Tu as choisi de supprimer un potin"
        @controller.delete_gossip
        puts
        puts

      when 4
        puts "Ciao !"
        break

      else
        puts "Choix invalide, il faut recommencer"
      end
    end
  end
end