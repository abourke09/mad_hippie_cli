class Scraper

  def initialize
    @doc = Nokogiri::HTML(open("https://www.madhippie.com/collections/all-products"))
  end

  def scrape_products
    @urls = []

    links = @doc.css("a.grid-link")
    links.each {|link| @urls << link["href"]}
    #take Product.all array of whatever it is and take out the URL for each
    #put that URL in Nokogiri
    #when scraping with Nokogiri, assign the name, price, and description for each Product instance.
    #whew! hope it works!!!!! :o
    @urls.each do |url|
      full_link = "https://www.madhippie.com"+"#{url}"
      binding.pry
      @product_page = Nokogiri::HTML(open(full_link))

      name = @product_page.css("h1").text
      url = full_link
      price = @product_page.css("#ProductPrice").text.strip
      description = @product_page.css("p strong").text

      Product.new(name, url, price, description)
    end
  end


#
#    def self.urls
#      @urls
#    end
#
#    def scrape_urls
#      links = @doc.css("a.grid-link")
#      links.each {|link| @urls << link["href"]}
#    end

end
