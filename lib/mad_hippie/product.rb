class Product
  attr_accessor :name, :price, :url, :description

  @@all = []

  def initialize(name=nil, price=nil, url=nil, description=nil)
    @name = name
    @price = price
    @url = url
    @description = description
    @@all << self
  end

  def self.all
    @@all
  end

=begin
  def self.all
    products = [ ]

  #  @urls = Scraper.scrape_urls
  #  @urls.each {|url| products << url}

    doc = Nokogiri::HTML(open("https://www.madhippie.com/collections/all-products"))
    text = doc.css("p.grid-link__title")
    text.each {|name| products << name.text}
    products.delete("Mad Hippie")

    products
  #  item_1 = self.new
  #  item_1.name = "Vitamin C Serum"
  #  item_1.price = "$33.99"
  #  item_1.url = "https://www.madhippie.com/collections/all-products/products/vitamin-c-serum"

  #  item_2 = self.new
  #  item_2.name = "Antioxidant Facial Oil"
  #  item_2.price = "$24.99"
  #  item_2.url = "https://www.madhippie.com/collections/all-products/products/antioxidant-facial-oil"

  #  [item_1, item_2]
  end
=end

  def scrape_products
    products = [ ]

    products << self.scrape_mad_hippie

    products
  end

  def scrape_mad_hippie
    products = [ ]

    doc = Nokogiri::HTML(open("https://www.madhippie.com/collections/all-products"))
    text = doc.css("p.grid-link__title")
    text.each {|name| products << name.text}
    products.delete("Mad Hippie")

    return products
  end

end
