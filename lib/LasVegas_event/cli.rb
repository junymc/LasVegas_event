class LasVegasEvent::CLI

  def call
    welcome
    list_events
    search
  end

  def welcome
    puts "Welcome to Las Vegas Event Calender where you can find the best events in Las Vegas!"
  end

  def list_events
    puts "Specil events"
    @events = LasVegasEvent::Scraper.listing
    @events.each.with_index do |event, i|
      puts "#{i}. #{events.name} - #{events.date_time} - #{events.price} - #{events.location}"
    end
  end

  def search
    puts "What are you looking for today?"
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        # the_deal = @deals[input.to_i-1]
        puts "#{i}. #{deal.name} - #{events.date_time} - #{events.price} - #{events.location}"
      elsif input == "list"
        list_deals
      elsif input == "exit"
        goodbye
      else
        puts "The event can not be found. Type again or exit."
      end
    end
  end

  def goodbye
    input = nil
    if input = "exit"
      puts "Thank you for visiting with us. See you again!"
    end
  end

end
