class Product
  attr_accessor :name, :price, :url, :description

  @@all = []

  def initialize(name, price, url, description)
    # attr_hash.each {|k,v| self.send("#{k}=", v)}
    @name = name
    @price = price
    @url = url
    @description = description
    @@all << self
  end

  def self.all
    @@all
  end

end
