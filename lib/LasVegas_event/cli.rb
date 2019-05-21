class LasVegasEvent::CLI

  def call
    welcome
    list_deals
    search
  end

  def welcome
    puts "Welcome to Offer Up where you can find a tresure in your area!"
  end

  def list_deals
    puts "Specil deals"
    @deals = OfferUp::Scraper.listing
    @deals.each.with_index do |deal, i|
      puts "#{i}. #{deal.name} - #{deal.price} - #{deal.area}"
    end
  end

  def search
    puts "What are you looking for today?"
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        # the_deal = @deals[input.to_i-1]
        puts "#{i}. #{deal.name} - #{deal.price} - #{deal.area}"
      elsif input == "list"
        list_deals
      elsif input == "exit"
        goodbye
      else
        puts "The item can not be found. Type again or exit."
      end
    end
  end

  def goodbye
    input = nil
    if input = "exit"
      puts "Thank you for shopping with us. See you again!"
    end
  end

end
