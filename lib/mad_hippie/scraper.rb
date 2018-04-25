class Scraper

  def self.scrape_urls
    doc = Nokogiri::HTML(open("https://www.madhippie.com/collections/all-products"))
    links = doc.css("a.grid-link")
    links.each {|link| Product.new(url = link["href"])}
  end

  def self.scrape_products
    #take Product.all array of whatever it is and take out the URL for each
    #put that URL in Nokogiri
    #when scraping with Nokogiri, assign the name, price, and description for each Product instance.
    #whew! hope it works!!!!! :o
    Product.all.each do |item|
      puts item.url
      binding.pry
    end

  end

end
