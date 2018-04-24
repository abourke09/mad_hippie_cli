class CLI

  def call
    puts "Welcome to the Mad Hippie CLI!"
    list_products
    menu
    goodbye
  end

  def list_products
    puts <<-DOC
    1. Vitamin C Serum
    2. Antioxidant Facial Oil
    3. Exfoliating Serum
    DOC
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the skincare item you would like to know more about. Alternatively, type 'list' to view all of the products again, or 'exit' to leave."
      input = gets.strip.downcase
      case input
      when "1"
        puts "more info on product 1"
      when "2"
        puts "more info on product 2"
      when "3"
        puts "more infor on product 3"
      when "list"
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
