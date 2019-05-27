class LasVegasEvent::CLI

  def call
    welcome
    fetch_events
    list_events
    search
  end

  def welcome
    puts "===================================================================================="
    puts "Welcome to Las Vegas Event Calendar where you can find the best events in Las Vegas!".green
    puts "===================================================================================="
  end

  def fetch_events
    LasVegasEvent::Scraper.scrape_events_list
  end

  def list_events
    puts "---------------------"
    puts "|Special events list|".yellow
    puts "---------------------"
    LasVegasEvent::Deal.all.each.with_index(1) do |event, i|
      puts "#{i}. #{event.name} - #{event.date_time} - #{event.location}".light_blue
    end
  end

  def search
    puts "** Which event do you want to know more about? Type the number of event. **".green
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= 99
          event = LasVegasEvent::Deal.all[input.to_i-1]
            puts "************************************************************************************************"
            puts "#{event.name} - #{event.date_time} - #{event.location}".light_blue
            puts event.events_description.yellow
      elsif input == "list"
              list_events
      elsif input == "exit"
        goodbye
      else
        puts "The event can not be found.".red
        puts "---------------------------"
        puts "** Type again or exit. **".green
      end
    end
  end

  def goodbye
    input = nil
    if input = "exit"
      puts "========================================="
      puts "Thank you for visiting us. See you again!".green
      puts "========================================="
    end
  end

end
