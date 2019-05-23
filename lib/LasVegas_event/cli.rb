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
    puts "Special events"
    events = LasVegasEvent::Deal.all
    events.each.with_index do |event, i|
      puts "#{i}. #{name} - #{date_time} - #{location}"
    end
  end

  def events_description
    puts "More information for the event"
    description = LasVegasEvent::Deal.all[index - 1]
    puts "#{description.events_description}"

  end

  def search
    puts "Which event do you want to know more about? Type the number of event."
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        # the_deal = @deals[input.to_i-1]
        puts "#{i}. #{name} - #{date_time} - #{location}"
        puts events_description
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
