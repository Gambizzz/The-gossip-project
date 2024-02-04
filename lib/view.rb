
class View
  def create_gossip
    puts "Quel est ton nom ?"
    print author = gets.chomp

    puts " quel est ton potin ?"
    print content = gets.chomp
    
    params = {content: content, author: author}
    return params
  end

  def index_gossips(gossips)
    gossips.each do |gossip, index|
      puts "#{index} = #{gossip.author} , #{gossip.content}."
    end
  end

  def delete_gossip
    puts "Quel potin veux-tu supprimer ?"
    index = gets.chomp
    return index
  end
end

  