class Scraper

  def self.scrape_urls
#    urls = [ ]

    doc = Nokogiri::HTML(open("https://www.madhippie.com/collections/all-products"))
    links = doc.css("a.grid-link")
#    links.each {|link| urls << link["href"]}
#    urls

    links.each {|link| Product.new(url = link["href"])}
      
#   links.each do |link|
      #item = Product.new
      #item.url = link["href"]
    end

  end

end
