class LasVegasEvent::Scraper

  # def self.listing
  #   events = []
  #
  #   events << self.scrape_events_list
  #
  #   events
  # end

  def self.scrape_events_list

     doc = Nokogiri::HTML(open("https://events.lasvegascalendars.com/"))

        doc.css("div.timely-events-container").css("a.timely-event.timely-today").each do |timely|
# binding.pry
          name = timely.css("span.timely-title-text").text
          date_time = timely.css("span.timely-start-time").text.strip
          location = timely.css("span.timely-venue").text.strip
          events_description = doc.css("div.timely-description.timely-has-venue").text.strip
          LasVegasEvent::Deal.new(name, date_time, location, events_description)
       end
  end

end
