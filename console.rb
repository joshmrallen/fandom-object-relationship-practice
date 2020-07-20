require 'pry'
require_relative './fandom'
require_relative './band'
require_relative './fan'

def create_fans
    number = Random.new
    random = number.rand(1...500)
    
    fanbase = []

    index = 0
    while index < random
        fanbase << Fan.new("Fan#{index}")
        index += 1
    end
    
    fanbase
end

def create_bands
    number = Random.new
    random = number.rand(1...10)

    bands = []

    index = 0
    while index < random
        bands << Band.new("Band#{index}")
        index += 1
    end
    bands
end

def find_fans(band, fans)
    #associates fan instances with band instances
    #accepts a band instance and an array of fan instances
    fans.each do |fan|
        fan.add_band(band)
    end
    "#{band.name} now has #{band.num_fans} fans!"
end

def join_fandom(bands, fan)
    #for a fan to join multipl bands
    bands.each do |band|
        fan.add_band(band)
    end
end

def seed
    #creates fans, creates bands and associates them with eachother
    create_bands.each do |band|
        create_fans.each do |fan|
            band.add_fan(fan)
        end
    end
end

top_bands = seed

fanny = Fan.new("Fanny")

join_fandom(top_bands, fanny)


binding.pry