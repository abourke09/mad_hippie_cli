class MadHippie::CLI

  def initialize
    @scraper = MadHippie::Scraper.new
    @scraper.scrape_urls
    @scraper.scrape_products
    #MadHippie::Product.all ^replaces line 6 @products
  end

  def call
    puts "Welcome to the Mad Hippie CLI!"
    puts ""
    list_products
    menu
    goodbye
  end

  def list_products
    puts "Mad Hippie Skincare Line:"
    MadHippie::Product.all.each.with_index(1) do |item, i|
      puts "     #{i}. #{item.name}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts ""
      puts "Enter the number of the skincare item you would like to know more about."
      puts "Alternatively, type 'list' to view all of the products again, or 'exit' to leave."
      puts ""
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= MadHippie::Product.all.count
        x = input.to_i - 1
        puts "Product: #{MadHippie::Product.all[x].name}"
        puts "Price: #{MadHippie::Product.all[x].price}"
        puts "Description: #{MadHippie::Product.all[x].description}"
        puts ""
      elsif input == "list"
        list_products
      elsif input == "exit"
        break
      else
        puts "I'm not sure what you mean by that."
      end

    end
  end

  def goodbye
    puts "Thanks for visiting, come back anytime."
  end
end
