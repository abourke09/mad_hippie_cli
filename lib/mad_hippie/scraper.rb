class Scraper

  def self.scrape_urls
    urls = [ ]

    doc = Nokogiri::HTML(open("https://www.madhippie.com/collections/all-products"))
    links = doc.css("a.grid-link")
    links.each {|link| urls << link["href"]}

    urls
  end

end
