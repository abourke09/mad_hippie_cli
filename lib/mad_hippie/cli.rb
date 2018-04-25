class CLI

  def call
    puts "Welcome to the Mad Hippie CLI!"
    list_products
    menu
    goodbye
  end

  def list_products
    puts "Mad Hippie Skincare Line:"
    @products = Product.all
    @products.each.with_index(1) do |item, i|
      puts "#{i}. #{item.name}, #{item.price}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the skincare item you would like to know more about. Alternatively, type 'list' to view all of the products again, or 'exit' to leave."
      input = gets.strip.downcase

      if input.to_i > 0
        puts @products[input.to_i - 1]
      elsif input == "list"
        list_products
      else
        puts "I'm not sure what you mean."
      end

    end
  end

  def goodbye
    puts "Thanks for visiting, come back anytime."
  end
end
