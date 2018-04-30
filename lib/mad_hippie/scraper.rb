class MadHippie::Scraper
  attr_accessor :urls

  def initialize
    @doc = Nokogiri::HTML(open("https://www.madhippie.com/collections/all-products"))
    @urls = []
  end

  def scrape_urls
    links = @doc.css("a.grid-link")
    links.each {|link| @urls << link["href"]}
  end

  def scrape_products
    @urls.each do |url|
      full_link = "https://www.madhippie.com"+"#{url}"
      product_page = Nokogiri::HTML(open(full_link))

      name = product_page.css("h1").text
      price = product_page.css("#ProductPrice").text.strip
      url = full_link
      description = product_page.css("p strong").text

      MadHippie::Product.new(name, price, url, description)
    end
  end

end
