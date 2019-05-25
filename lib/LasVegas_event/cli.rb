class LasVegasEvent::CLI

  def call
    welcome
    fetch_events
    list_events
    search
  end

  def welcome
    puts "Welcome to Las Vegas Event Calender where you can find the best events in Las Vegas!".green
  end

  def fetch_events
    LasVegasEvent::Scraper.scrape_events_list
  end

  def list_events
    puts "Special events list".red
    LasVegasEvent::Deal.all.each.with_index(1) do |event, i|
      puts "#{i}. #{event.name} - #{event.date_time} - #{event.location}".light_blue
    end
  end

  def search
    puts "Which event do you want to know more about? Type the number of event.".green
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i <= 99
          event = LasVegasEvent::Deal.all[input.to_i-1]
            puts "#{event.name} - #{event.date_time} - #{event.location}".light_blue
            puts event.events_description.yellow
      elsif input == "list"
              list_events
      elsif input == "exit"
        goodbye
      else
        puts "The event can not be found. Type again or exit.".green
      end
    end
  end

  def goodbye
    input = nil
    if input = "exit"
      puts "Thank you for visiting with us. See you again!".green
    end
  end

end
