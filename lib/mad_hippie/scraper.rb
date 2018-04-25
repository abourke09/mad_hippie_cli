class Scraper

  def initialize
    @doc = Nokogiri::HTML(open("https://www.madhippie.com/collections/all-products"))
  end

  def scrape_urls
    urls = []
    links = @doc.css("a.grid-link")
    links.each {|link| urls << link["href"]}
    urls
    binding.pry
  #  links.each {|link| Product.new(url = link["href"])}
  end

  def scrape_products
    #take Product.all array of whatever it is and take out the URL for each
    #put that URL in Nokogiri
    #when scraping with Nokogiri, assign the name, price, and description for each Product instance.
    #whew! hope it works!!!!! :o
    urls.each do |url|
      full_link = "https://www.madhippie.com"+"url"
      @new_doc = Nokogiri::HTML(open(full_link))
      name = @new_doc.css("")
      url = full_link
      price = @new_doc.css("")
      description = @new_doc.css("")
      Product.new(name, url, price, description)
    end

    Product.all.each do |item|
      puts item.url
    end

  end

end
