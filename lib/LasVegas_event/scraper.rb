class LasVegasEvent::Scraper

  def self.scrape_events_list

     doc = Nokogiri::HTML(open("https://events.lasvegascalendars.com/"))

        doc.css("div.timely-events-container").css("a.timely-event").each do |timely|
# binding.pry
          name = timely.css("span.timely-title-text").text
          date_time = timely.css("span.timely-start-time").text.gsub(/\s+/, " ")
          location = timely.css("span.timely-venue").text.gsub(/\s+/, " ")
          url = timely.attr("href")
          events_description = timely.css("div.timely-description.timely-has-venue").text.gsub(/\s+/, " ")

          LasVegasEvent::Event.new(name, date_time, location, url, events_description)
       end
  end

  def self.get_url(event)
  binding.pry
      event_page = Nokogiri::HTML(open(event.url))
      event_webpage = event_page.css("div.a").attr("href")
      event.event_webpage = event_webpage
  end

end
