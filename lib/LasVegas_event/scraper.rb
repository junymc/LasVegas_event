class LasVegasEvent::Scraper

  def self.listing
    deals = []

    deals << self.scrape_events

    deals
  end

  def self.scrape_events
    doc = Nokogiri::HTML(open("https://events.lasvegascalendars.com/?event=28054955&instance=20190521130000"))
    # items = []

    #for every first we call there we have to iterate for each one
    #doc.css("div#db-item-list").css("div").first.css("a").first.css("img").first["alt"] -> getting container
binding.pry
     name = doc.css("h1.timely-event-title").text.gsub("\n\t\t\t\t\t\t\t\t\t\t", "")

    # doc.css("div#db-item-list").css("div").collect do |cards|
    #   cards.css("a").collect do |card|
    #     # somewhere in here we might need to do something to get price and location
    #       #in here is where we access to each item or card
    #
    #       card.css("span").collect do |item|
    #       items << item.text
    #       end

          #create items using that array


          #reset array inbetween iterations
      # end





      # deal.name = name.css(#css tag).text
      # deal.price = name.css(#css tag).text
      # deal.area = name.css(#css tag).text
      # deal.url = name.css(#css tag).text
      # deal.save

    #  end
  end
end
