class Scraper

  def self.scrape_urls
    urls = [ ]

    doc = Nokogiri::HTML(open("https://www.madhippie.com/collections/all-products"))
    links = doc.css("a.grid-link")
    binding.pry
    #text.each {|name| products << name.text}
    #products.delete("Mad Hippie")

    #urls

  end

end
