class Product
  attr_accessor :name, :price, :url

  def self.all
    products = [ ]

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

  def self.scrape_products
    products = [ ]

    products << self.scrape_mad_hippie

    products
  end

  def self.scrape_mad_hippie
    products = [ ]

    doc = Nokogiri::HTML(open("https://www.madhippie.com/collections/all-products"))
    text = doc.css("p.grid-link__title")
    text.each {|name| products << name.text}
    products.delete("Mad Hippie")

    return products
  end

end
