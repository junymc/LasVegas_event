class LasVegasEvent::CLI

  def call
    welcome
    fetch_events
    list_events
    details
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
    LasVegasEvent::Event.all.each.with_index(1) do |event, i|
      puts "#{i}. #{event.name}".light_blue
    end
  end

  def event_website(event)
    puts "** Do you want to check out the event website? Type 'y' or 'n' **".green
    input = gets.strip.downcase

    if input == "y"
      LasVegasEvent::Scraper.get_event_page(event) unless event.event_webpage
      puts "#{event.event_webpage}".cyan
      puts "** Type 'list' to see all the list or select number again. Type 'exit' if you wish to exit. **".green
    elsif input == "n"
      puts "** Type 'list' to see all the list or select number again. Type 'exit' if you wish to exit. **".green
    else
      puts "Sorry, try again.".red
    end
  end

  def details
    puts "** Which event do you want to know more about? Type the number of event. **".green
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= 10
          event = LasVegasEvent::Event.all[input.to_i-1]

            puts "************************************************************************************************"
            puts " #{event.name}".light_blue
            puts "#{event.date_time} - #{event.location}".cyan
            puts "#{event.events_description}\n".yellow
            puts "#{event.url}\n".cyan

          event_website(event)

      elsif input == "list"
              list_events
      elsif input == "exit"
        goodbye
      else
        puts "The event can not be found.".red
        puts "---------------------------"
        puts "** Type 'list' to see all the list or select number again. Type 'exit' if you wish to exit. **".green
      end
    end
  end

  def goodbye
    input = nil
    if input == "exit"
      puts "==========================================="
      puts " Thank you for visiting us. See you again!".green
      puts "==========================================="
    end
  end

end
