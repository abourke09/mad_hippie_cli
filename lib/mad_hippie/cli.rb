class CLI

  def initialize
    @scraper = Scraper.new
    @products = @scraper.scrape_products
  end

  def call
    puts "Welcome to the Mad Hippie CLI!"
    puts ""
    list_products
    menu
    goodbye
  end

#Q: How do I scrape my Descriptions better over all 13 products?
#Q: How do I upload my screenrecording in order to link it to the Learn Curriculum page?
#Q: Separation of concerns, clean up, ect
#Q: Is there a better way to add line spacing, other than 'puts "" ' ?
#Q: How do I indent the list of products? I tried using .indent(#) on the string but it didn't work.

  def list_products
    puts "Mad Hippie Skincare Line:"
    @products.each.with_index(1) do |item, i|
      puts "#{i}. #{item.name}"
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

      if input.to_i > 0
        x = input.to_i - 1
        puts "Product: #{@products[x].name}"
        puts "Price: #{@products[x].price}"
        puts "Description: #{@products[x].description}"
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
