class Fandom
    attr_accessor :fan, :band

    @@all = []

    def initialize(fan, band)
        @fan = fan
        @band = band
        Fandom.all << self
    end

    def self.all
        @@all
    end


end