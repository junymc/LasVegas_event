class LasVegasEvent::Scraper

  def self.scrape_events_list

     doc = Nokogiri::HTML(open("https://events.lasvegascalendars.com/"))

        doc.css("div.timely-events-container").css("a.timely-event.timely-today").each do |timely|
# binding.pry
          name = timely.css("span.timely-title-text").text
          date_time = timely.css("span.timely-start-time").text.gsub(/\s+/, " ")
          location = timely.css("span.timely-venue").text.gsub(/\s+/, " ")
          events_description = timely.css("div.timely-description.timely-has-venue").text.gsub(/\s+/, " ")
          LasVegasEvent::Deal.new(name, date_time, location, events_description)
       end
  end
end
