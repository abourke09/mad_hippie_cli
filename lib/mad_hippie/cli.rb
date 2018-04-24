class CLI

  def call
    puts "Welcome to Mad Hippie Skincare!"
  end

  def list_products
    puts <<-DOC
    1. Vitamin C Serum
    2. Antioxidant Facial Oil
    3. Exfoliating Serum
    DOC
  end

end
