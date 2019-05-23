class LasVegasEvent::Scraper

  def self.listing
    events = []

    events << self.scrape_events

    events
  end

  def self.scrape_events
    doc = Nokogiri::HTML(open("https://events.lasvegascalendars.com/?event=28054955&instance=20190521130000"))
    #doc.css("div#db-item-list").css("div").first.css("a").first.css("img").first["alt"] -> getting container
binding.pry
     name = doc.css("h1.timely-event-title").text.strip
     date_time = date_time = doc.css("span.timely-column-right").text.strip
     location = doc.css("span.timely-venue-name").text
    #  price = doc.css("div.timely-details timely-clearfixr").css("div").first

  end
end
