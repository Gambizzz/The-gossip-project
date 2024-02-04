class Gossip
  attr_reader :author, :content

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("db/gossip.csv","a") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = []
    CSV.foreach("db/gossip.csv") do |row|
      gossip_prov = Gossip.new(row[0], row [1])
      all_gossips << gossip_prov
    end
    return all_gossips
  end

  def self.delete_gossip(index)  #méthode pour effacer un potin
    rows = File.readlines("db/gossip.csv")  
    rows.delete_at(index.to_i) #on va chercher quelle ligne il faut effacer
    new_rows = rows

    File.open("db/gossip.csv", "w") {|file| file.truncate(0)}

    new_rows.each do |row|  #on va réecrire sans la ligne supprimée
      File.open("db/gossip.csv", "a") {|f| f.write row}
    end
  end
end
