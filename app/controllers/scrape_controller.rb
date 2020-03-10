require 'nokogiri'
require 'open-uri'

class ScrapeController < ApplicationController

    def popular_destinations

        url = 'https://www.townandcountrymag.com/leisure/travel-guide/g17236981/best-places-to-visit-in-april/'
        doc = Nokogiri::HTML(open(url))
        # destinations = []
        places = doc.css('.listicle-slide')
        destinations = places.map do |place|
                {
                title: place.css('.listicle-slide-hed-text').text,
                image: place.css('source')[1].values[0],
                description: place.css('p').text
                }
            # destinations << destination
        end
        render json: {results: destinations}
    end

    def family_vacations

        url = 'https://www.tripstodiscover.com/best-family-vacations-with-toddlers/8/'
        
        page = Nokogiri::HTML(open(url))
        slides = page.css('.page')
        destinations = slides.map do |slide| 
            {
            title: slide.css('h2').text,
            image: slide.css('img').attr('data-src').value,
            description: slide.css('p').text
            }
        end
        render json: {results: destinations}
    end

    def weekend_getaways

        url = 'https://vacationidea.com/romance/romantic_beach_getaways.html'

        doc = Nokogiri::HTML(open(url))
        places = doc.css('.slideshow')
        destinations = places.map do |place|
            {
            title: place.css('.slide-title').text,
            description: place.css('p')[0].text.strip,
            image: place.css('.slide-image img').attr('src').value
            }
            # destinations << destination
        end
        render json: {results: destinations}
    end

    def explore

        url = 'https://www.businessinsider.com/underrated-travel-destinations-to-visit-in-2020-intrepid-travel-2020-2'
        doc = Nokogiri::HTML(open(url))        
        
        places = doc.css('.slide')
        
        destinations = places.map do |place|
            {
            title: place.css('.slide-title-text').text,
            image: place.css('.lazy-holder noscript img').attr('src').value,
            description: place.css('p').text
            }
                # destinations << destination
        end
        render json: {results: destinations}
    end

    def not_your_average

        url = 'https://www.tripstodiscover.com/best-astronomy-tours-in-the-world/'
            page = Nokogiri::HTML(open(url))
            slides = page.css('.page')
            destinations = slides.map do |slide| 
                {
                title: slide.css('h2').text,
                image: slide.css('img').attr('data-src').value,
                description: slide.css('p').text
                }
            end
            render json: {results: destinations}
    end

    def adventure

        url = 'https://www.tripstodiscover.com/20-cool-travel-destinations-for-the-adventure-junkie/'
        
        page = Nokogiri::HTML(open(url))
        slides = page.css('.page')
        destinations = slides.map do |slide| 
            {
            title: slide.css('h2').text,
            imageg: slide.css('img').attr('data-src').value,
            description: slide.css('p').text
            }
        end
        render json: {results: destinations}
    end

end
