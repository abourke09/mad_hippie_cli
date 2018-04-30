class MadHippie::Product
  attr_accessor :name, :price, :url, :description

  @@all = []

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.all
    @@all
  end

end
