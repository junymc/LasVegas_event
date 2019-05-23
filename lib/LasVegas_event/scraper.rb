class LasVegasEvent::Scraper

  def self.listing
    events = []

    events << self.scrape_events_list

    events
  end

  def self.scrape_events_list
#     doc = Nokogiri::HTML(open("https://events.lasvegascalendars.com/?event=28054955&instance=20190521130000"))
#     #doc.css("div#db-item-list").css("div").first.css("a").first.css("img").first["alt"] -> getting container
# binding.pry
#      name = doc.css("h1.timely-event-title").text.strip
#      date_time = date_time = doc.css("span.timely-column-right").text.strip
#      location = doc.css("span.timely-venue-name").text
#      price = doc.css("div.timely-layout-col-sm-10 timely-event-padding").children("div").text


     doc = Nokogiri::HTML(open("https://events.lasvegascalendars.com/"))

        doc.css("div.timely-events-container").css("a.timely-event timely-today").each do |timely|
          binding.pry
          name = timely.css("span.timely-title-text").text
          date_time = timely.css("span.timely-start-time").text.strip
          location = timely.css("span.timely-venue").text.strip

          LasVegasEvent::Deal.new(name, date_time, location)
       end
  end

  def self.scrape_events_description(event)
    doc = Nokogiri::HTML(open(event.url))

    events_description = doc.css("div.timely-description timely-has-venue").text.strip
  end

end
