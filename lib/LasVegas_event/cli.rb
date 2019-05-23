class LasVegasEvent::CLI

  def call
    welcome
    fetch_events
    list_events
    search
  end

  def welcome
    puts "Welcome to Las Vegas Event Calender where you can find the best events in Las Vegas!"
  end

  def fetch_events
    LasVegasEvent::Scraper.scrape_events_list
  end

  def list_events
    puts "Special events"
    LasVegasEvent::Deal.all.each.with_index(1) do |event, i|
      puts "#{i}. #{event.name} - #{event.date_time} - #{event.location}"
    end
  end

  def events_description(i)
    puts "More information for the event"
    description = LasVegasEvent::Deal.all[i - 1]
    puts "#{description.events_description}"

  end

  def search
    puts "Which event do you want to know more about? Type the number of event."
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        list_events
      elsif input == "description"
        events_description(input.to_i)
      elsif input == "list"
        list_events
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
